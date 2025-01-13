using System;
using System.Collections.Generic;
using System.Reflection;
using Sandbox;
using Sandbox.Diagnostics;
using PTR = int;

namespace LuaBox;

public struct ContextOptions
{
	public bool BindSandboxTypes { get; set; } = true;

	public ContextOptions()
	{
	}
}

public enum Op : int
{
	Add			= 0,
	Sub			= 1,
	Mul			= 2,
	Mod			= 3,
	Pow			= 4,
	Div			= 5,
	IDiv		= 6,
	BAnd		= 7,
	BOr			= 8,
	BXor		= 9,
	Shl			= 10,
	Shr			= 11,
	Unm			= 12,
	BNot		= 13,
}

public enum EqOp : int
{
	Eq			= 0,
	Lt			= 1,
	Le			= 2,
}

public enum GC : int
{
	Stop			= 0,
	Restart			= 1,
	Collect			= 2,
	Count			= 3,
	CountB			= 4,
	Step			= 5,
	SetPause		= 6,
	SetStepMul		= 7,
	IsRunning		= 9,
	Gen				= 10,
	Inc				= 11,
}

public enum LuaType : int
{
	None			= (-1),

	Nil				= 0,
	Boolean			= 1,
	LightUserData	= 2,
	Number			= 3,
	String			= 4,
	Table			= 5,
	Function		= 6,
	UserData		= 7,
	Thread			= 8,

	NumTypes		= 9,
}

public static class Lua
{
	internal static Dextr.Lua Module;

	public const int MultRet = -1;

	public static void Init()
	{
		Module = new();
	}

	public static LuaContext CreateContext()
	{
		return CreateContext( new ContextOptions() );
	}

	public static LuaContext CreateContext( in ContextOptions options )
	{
		if (Module == null)
		{
			Log.Error("Lua.Init hasn't been called!");
		}

		return new LuaContext( options );
	}
}

public class LuaContext : IDisposable
{
	internal PTR L = 0;
	internal static Dictionary<PTR, LuaContext> ContextByPtr = new();

	internal Dictionary<object, PTR> ObjectPool = new();

	public delegate int CFunction( LuaContext context );

	public LuaContext( in ContextOptions options )
	{
		L = Lua.Module.luaL_newstate();
		Assert.True( L != 0 );
		ContextByPtr[L] = this;

		Lua.Module.luaL_openlibs( L );

		CreateTestLibrary();

		Log.Info( $"options {options.BindSandboxTypes}" );
		if (options.BindSandboxTypes)
		{
			InitTypeBindings();
		}
	}

	~LuaContext()
	{
		Dispose();
	}

	public void Dispose()
	{
		ContextByPtr.Remove( L );

		if ( Lua.Module != null && L != 0 )
		{
			Lua.Module.lua_close( L );
			L = 0;
		}
	}

	protected PTR GetObjectPtr( object obj )
	{
		if ( ObjectPool.TryGetValue( obj, out PTR ptr ) )
			return ptr;

		ptr = Dextr.Lua.Mem.AllocNewObject( obj );
		ObjectPool.Add( obj, ptr );
		return ptr;
	}

	internal PTR GetFunctionPtr( Dextr.Lua.Mem.ExternalFunc fn )
	{
		if ( ObjectPool.TryGetValue( fn, out PTR ptr ) )
			return ptr;

		ptr = Dextr.Lua.Mem.AllocNewFunction( fn );
		ObjectPool.Add( fn, ptr );
		return ptr;
	}

	protected void InitTypeBindings()
	{
		foreach (var type in TypeLibrary.GetTypes())
		{
			if ( type.Namespace == null || !type.Namespace.StartsWith("Sandbox") )
				continue;

			CreateLibraryForType( type );
			//CreateBindingsForType( type );
		}
	}

	protected void CreateTestLibrary()
	{
		Log.Info( "creating test library" );

		NewLib( new (string, CFunction)[] {
			( "runtest", TestFunc )
		} );
		SetGlobal("TestLib");
	}

	protected static int TestFunc( LuaContext ctx )
	{
		Log.Info( $"testfunc called on context {ctx}!" );
		return 0;
	}

	protected object LuaToManaged( Type type, int index )
	{
		if ( type == typeof( int ) )
		{
			return (int)ToInteger( index );
		}
		else if ( type == typeof( long ) )
		{
			return ToInteger( index );
		}
		else if ( type == typeof( float ) )
		{
			return (float)ToNumber( index );
		}
		else if ( type == typeof( double ) )
		{
			return ToNumber( index );
		}

		PTR ptr = ToPointer( index );
		object managedObject = null;
		if (ptr != 0)
		{
			managedObject = Dextr.Lua.Mem.GetObject<object>( ptr );
		}

		return managedObject;
	}

	protected void PushManagedToLua( object obj )
	{
		if ( obj.GetType() == typeof( int ) )
		{
			PushInteger( (int)obj );
		}
		else if ( obj.GetType() == typeof( long ) )
		{
			PushInteger( (long)obj );
		}
		else if ( obj.GetType() == typeof( float ) )
		{
			PushNumber( (float)obj );
		}
		else if ( obj.GetType() == typeof( double ) )
		{
			PushNumber( (double)obj );
		}
		else
		{
			PTR ptr = GetObjectPtr( obj );
			PushLightUserData( ptr );
		}
	}

	protected void CreateLibraryForType( TypeDescription type )
	{

	}

	protected void CreateBindingsForType( TypeDescription type )
	{
		foreach ( var func in type.Methods )
		{
			var lambda = ( PTR STATE ) => {
				Assert.True( STATE == L );

				object instance = null;
				if (!func.IsStatic)
				{
					PTR instPtr = ToPointer( 1 );
					instance = Dextr.Lua.Mem.GetObject<object>( instPtr );
				}

				int stackOffset = func.IsStatic ? 1 : 2;
				object[] args = new object[func.Parameters.Length];
				for ( int iArg = 0; iArg < args.Length; ++iArg )
				{
					var param = func.Parameters[iArg];
					args[iArg] = LuaToManaged( param.ParameterType, iArg + stackOffset );
				}

				Log.Info( $"Invoke '{func.Name}' on instance {instance} with args {args}" );
				if ( func.ReturnType == typeof( void ) )
				{
					func.Invoke( instance, args );
					return 0;
				}
				else
				{
					object ret = func.InvokeWithReturn<object>( instance, args );
					PushManagedToLua( ret );
					return 1;
				}
			};

			Register( lambda, func.Name );
			Log.Info( $"Registered func: '{func.Name}'" );
		}
	}

	public bool LoadFile( string file )
	{
		Assert.True( L != 0 );

		var ( scope, pFile ) = Lua.Module.ScopedString( file );
		try {
			int status = Lua.Module.luaL_loadfilex( L, pFile, 0 );

			if ( status != 0 )
			{
				Log.Error($"Couldn't load file: {ToString(-1)}");
				return false;
			}

			return true;
		}
		finally {
			scope.Dispose();
		}
	}

	// basic stack manipulation
	public int AbsIndex( int idx )
	{
		Assert.True( L != 0 );
		return Lua.Module.lua_absindex( L, idx );
	}

	public int GetTop()
	{
		Assert.True( L != 0 );
		return Lua.Module.lua_gettop( L );
	}

	public void SetTop( int idx )
	{
		Assert.True( L != 0 );
		Lua.Module.lua_settop( L, idx );
	}

	public void PushValue( int idx )
	{
		Assert.True( L != 0 );
		Lua.Module.lua_pushvalue( L, idx );
	}

	public void Rotate( int idx, int n )
	{
		Assert.True( L != 0 );
		Lua.Module.lua_rotate( L, idx, n );
	}

	public void Copy( int fromidx, int toidx )
	{
		Assert.True( L != 0 );
		Lua.Module.lua_copy( L, fromidx, toidx );
	}

	public int CheckStack( int n )
	{
		Assert.True( L != 0 );
		return Lua.Module.lua_checkstack( L, n );
	}

	public void XMove( LuaContext dest, int n )
	{
		Assert.True( L != 0 );
		Assert.True( dest.L != 0 );
		Lua.Module.lua_xmove( L, dest.L, n );
	}

	// access functions (stack -> C)
	public bool IsNumber( int idx )
	{
		Assert.True( L != 0 );
		return Lua.Module.lua_isnumber( L, idx ) != 0;
	}

	public bool IsString( int idx )
	{
		Assert.True( L != 0 );
		return Lua.Module.lua_isstring( L, idx ) != 0;
	}

	public bool IsCFunction( int idx )
	{
		Assert.True( L != 0 );
		return Lua.Module.lua_iscfunction( L, idx ) != 0;
	}

	public bool IsInteger( int idx )
	{
		Assert.True( L != 0 );
		return Lua.Module.lua_isinteger( L, idx ) != 0;
	}

	public bool IsUserData( int idx )
	{
		Assert.True( L != 0 );
		return Lua.Module.lua_isuserdata( L, idx ) != 0;
	}

	public LuaType Type( int idx )
	{
		Assert.True( L != 0 );
		return (LuaType)Lua.Module.lua_type( L, idx );
	}

	public string TypeName( int tp )
	{
		Assert.True( L != 0 );
		PTR str = Lua.Module.lua_typename( L, tp );
		string value = Dextr.Lua.GetString( str );
		return value;
	}

	public double ToNumberX( int idx, out bool isnum )
	{
		Assert.True( L != 0 );

		PTR p_isnum = Lua.Module.dex_builtin_malloc( 4 );
		double ret = Lua.Module.lua_tonumberx( L, idx, p_isnum );
		isnum = Dextr.Lua.Mem.LoadInt( p_isnum ) != 0;
		Lua.Module.dex_builtin_free( p_isnum );
		return ret;
	}

	public long ToIntegerX( int idx, out bool isnum )
	{
		Assert.True( L != 0 );

		PTR p_isnum = Lua.Module.dex_builtin_malloc( 4 );
		long ret = Lua.Module.lua_tointegerx( L, idx, p_isnum );
		isnum = Dextr.Lua.Mem.LoadInt( p_isnum ) != 0;
		Lua.Module.dex_builtin_free( p_isnum );
		return ret;
	}

	public bool ToBoolean( int idx )
	{
		Assert.True( L != 0 );
		return Lua.Module.lua_toboolean( L, idx ) != 0;
	}

	internal PTR ToLString( int idx, out int length )
	{
		Assert.True( L != 0 );

		PTR p_length = Lua.Module.dex_builtin_malloc( 4 );
		PTR str = Lua.Module.lua_tolstring( L, idx, p_length );
		length = Dextr.Lua.Mem.LoadInt( p_length );
		Lua.Module.dex_builtin_free( p_length );
		return str;
	}

	public string ToString( int idx )
	{
		Assert.True( L != 0 );
		PTR pStr = Lua.Module.lua_tolstring( L, idx, 0 );
		return Dextr.Lua.GetString( pStr );
	}

	public ulong RawLen( int idx )
	{
		Assert.True( L != 0 );
		return unchecked((ulong)Lua.Module.lua_rawlen( L, idx ));
	}

	internal PTR ToCFunction( int idx )
	{
		Assert.True( L != 0 );
		return Lua.Module.lua_tocfunction( L, idx );
	}

	internal PTR ToUserData( int idx )
	{
		Assert.True( L != 0 );
		return Lua.Module.lua_touserdata( L, idx );
	}

	internal PTR ToPointer( int idx )
	{
		Assert.True( L != 0 );
		return Lua.Module.lua_topointer( L, idx );
	}

	// Comparison and arithmetic functions
	public void Arith( Op op )
	{
		Assert.True( L != 0 );
		Lua.Module.lua_arith( L, (int)op );
	}

	public bool RawEqual( int idx1, int idx2 )
	{
		Assert.True( L != 0 );
		return Lua.Module.lua_rawequal( L, idx1, idx2 ) != 0;
	}

	public int Compare( int idx1, int idx2, EqOp op )
	{
		Assert.True( L != 0 );
		return Lua.Module.lua_compare( L, idx1, idx2, (int)op );
	}

	// push functions (C -> stack)
	public void PushNil()
	{
		Assert.True( L != 0 );
		Lua.Module.lua_pushnil( L );
	}

	public void PushNumber( double n )
	{
		Assert.True( L != 0 );
		Lua.Module.lua_pushnumber( L, n );
	}

	public void PushInteger( long n )
	{
		Assert.True( L != 0 );
		Lua.Module.lua_pushinteger( L, n );
	}

	public void PushString( string s )
	{
		Assert.True( L != 0 );

		var (scope, pStr) = Lua.Module.ScopedString( s );
		try
		{
			Lua.Module.lua_pushstring( L, pStr );
		}
		finally
		{
			scope.Dispose();
		}
	}

	internal void PushCClosure( PTR fn, int n )
	{
		Assert.True( L != 0 );
		Lua.Module.lua_pushcclosure( L, fn, n );
	}

	public void PushCClosure( Func<PTR, int> fn, int n )
	{
		var ptr = GetFunctionPtr( ( args ) => {
			return fn( (PTR)args[0] );
		} );
		PushCClosure( ptr, n );
	}

	public void PushBoolean( bool b )
	{
		Assert.True( L != 0 );
		Lua.Module.lua_pushboolean( L, b ? 1 : 0 );
	}

	internal void PushLightUserData( PTR p )
	{
		Assert.True( L != 0 );
		Lua.Module.lua_pushlightuserdata( L, p );
	}

	// get functions (Lua -> stack)
	public int GetGlobal( string name )
	{
		Assert.True( L != 0 );

		var (scope, pStr) = Lua.Module.ScopedString( name );
		try
		{
			return Lua.Module.lua_getglobal( L, pStr );
		}
		finally
		{
			scope.Dispose();
		}
	}

	public int GetTable( int idx )
	{
		Assert.True( L != 0 );
		return Lua.Module.lua_gettable( L, idx );
	}

	public int GetField( int idx, string k )
	{
		Assert.True( L != 0 );

		var (scope, pStr) = Lua.Module.ScopedString( k );
		try
		{
			return Lua.Module.lua_getfield( L, idx, pStr );
		}
		finally
		{
			scope.Dispose();
		}
	}

	public int GetI( int idx, long n )
	{
		Assert.True( L != 0 );
		return Lua.Module.lua_geti( L, idx, n );
	}

	public int RawGet( int idx )
	{
		Assert.True( L != 0 );
		return Lua.Module.lua_rawget( L, idx );
	}

	public int RawGetI( int idx, long n )
	{
		Assert.True( L != 0 );
		return Lua.Module.lua_rawgeti( L, idx, n );
	}

	internal int RawGetP( int idx, PTR p )
	{
		Assert.True( L != 0 );
		return Lua.Module.lua_rawgetp( L, idx, p );
	}

	public void CreateTable( int narr, int nrec )
	{
		Assert.True( L != 0 );
		Lua.Module.lua_createtable( L, narr, nrec );
	}

	internal PTR NewUserDataUV( int sz, int nuvalue )
	{
		Assert.True( L != 0 );
		return Lua.Module.lua_newuserdatauv( L, sz, nuvalue );
	}

	public int GetMetatable( int objindex )
	{
		Assert.True( L != 0 );
		return Lua.Module.lua_getmetatable( L, objindex );
	}

	public int GetIUserValue( int idx, int n )
	{
		Assert.True( L != 0 );
		return Lua.Module.lua_getiuservalue( L, idx, n );
	}

	// set functions (stack -> Lua)
	public void SetGlobal( string name )
	{
		Assert.True( L != 0 );

		var (scope, pStr) = Lua.Module.ScopedString( name );
		try
		{
			Lua.Module.lua_setglobal( L, pStr );
		}
		finally
		{
			scope.Dispose();
		}
	}

	public void SetTable( int idx )
	{
		Assert.True( L != 0 );
		Lua.Module.lua_settable( L, idx );
	}

	public void SetField( int idx, string k )
	{
		Assert.True( L != 0 );

		var (scope, pStr) = Lua.Module.ScopedString( k );
		try
		{
			Lua.Module.lua_setfield( L, idx, pStr );
		}
		finally
		{
			scope.Dispose();
		}
	}

	public void SetI( int idx, long n )
	{
		Assert.True( L != 0 );
		Lua.Module.lua_seti( L, idx, n );
	}

	public void RawSet( int idx )
	{
		Assert.True( L != 0 );
		Lua.Module.lua_rawset( L, idx );
	}

	public void RawSetI( int idx, long n )
	{
		Assert.True( L != 0 );
		Lua.Module.lua_rawseti( L, idx, n );
	}

	internal void RawSetP( int idx, PTR p )
	{
		Assert.True( L != 0 );
		Lua.Module.lua_rawsetp( L, idx, p );
	}

	public int SetMetatable( int objindex )
	{
		Assert.True( L != 0 );
		return Lua.Module.lua_setmetatable( L, objindex );
	}

	public int SetIUserValue( int idx, int n )
	{
		Assert.True( L != 0 );
		return Lua.Module.lua_setiuservalue( L, idx, n );
	}

	// 'load' and 'call' functions (load and run Lua code)
	internal void CallK( int nargs, int nresults, int ctx, PTR k )
	{
		Assert.True( L != 0 );
		Lua.Module.lua_callk( L, nargs, nresults, ctx, k );
	}

	public void Call( int nargs, int nresults )
	{
		CallK( nargs, nresults, 0, 0 );
	}

	internal int PCallK( int nargs, int nresults, int errfunc, int ctx, PTR k )
	{
		Assert.True( L != 0 );
		return Lua.Module.lua_pcallk( L, nargs, nresults, errfunc, ctx, k );
	}

	public int PCall( int nargs, int nresults, int errfunc )
	{
		return PCallK( nargs, nresults, errfunc, 0, 0 );
	}

	// TODO: Load/Dump
	// Needs glue functions/temp lambda support

	// Warning-related functions
	// TODO

	// garbage-collection function and options
	public int GC( GC what )
	{
		Assert.True( L != 0 );
		return Lua.Module.lua_gc( L, (int)what );
	}

	public int GC( GC what, int data )
	{
		Assert.True( L != 0 );
		return Lua.Module.lua_gc( L, (int)what, data );
	}

	// miscellaneous functions
	public int Error()
	{
		Assert.True( L != 0 );
		return Lua.Module.lua_error( L );
	}

	public int Next( int idx )
	{
		Assert.True( L != 0 );
		return Lua.Module.lua_next( L, idx );
	}

	public void Concat( int n )
	{
		Assert.True( L != 0 );
		Lua.Module.lua_concat( L, n );
	}

	public void Len( int idx )
	{
		Assert.True( L != 0 );
		Lua.Module.lua_len( L, idx );
	}

	public int StringToNumber( string s )
	{
		Assert.True( L != 0 );

		var (scope, pStr) = Lua.Module.ScopedString( s );
		try
		{
			return Lua.Module.lua_stringtonumber( L, pStr );
		}
		finally
		{
			scope.Dispose();
		}
	}

	public void ToClose( int idx )
	{
		Assert.True( L != 0 );
		Lua.Module.lua_toclose( L, idx );
	}

	public void CloseSlot( int idx )
	{
		Assert.True( L != 0 );
		Lua.Module.lua_closeslot( L, idx );
	}

	// Useful "macros"
	public double ToNumber( int idx )
	{
		Assert.True( L != 0 );
		return Lua.Module.lua_tonumberx( L, idx, 0 );
	}

	public long ToInteger( int idx )
	{
		Assert.True( L != 0 );
		return Lua.Module.lua_tointegerx( L, idx, 0 );
	}

	public void Pop( int n )
	{
		Assert.True( L != 0 );
		SetTop( -(n)-1 );
	}

	public void NewTable()
	{
		Assert.True( L != 0 );
		Lua.Module.lua_createtable( L, 0, 0 );
	}

	public void Register( Func<PTR, int> fn, string name )
	{
		PushCFunction( fn );
		SetGlobal( name );
	}

	public void PushCFunction( Func<PTR, int> fn )
	{
		PushCClosure( fn, 0 );
	}

	public bool IsFunction( int n ) { return Type( n ) == LuaType.Function; }
	public bool IsTable( int n ) { return Type( n ) == LuaType.Table; }
	public bool IsLightUserData( int n ) { return Type( n ) == LuaType.LightUserData; }
	public bool IsNil( int n ) { return Type( n ) == LuaType.Nil; }
	public bool IsBoolean( int n ) { return Type( n ) == LuaType.Boolean; }
	public bool IsThread( int n ) { return Type( n ) == LuaType.Thread; }
	public bool IsNone( int n ) { return Type( n ) == LuaType.None; }
	public bool IsNoneOrNil( int n ) { return (int)Type( n ) <= 0; }

	public void Insert( int idx )
	{
		Rotate( idx, 1 );
	}

	public void Remove( int idx )
	{
		Rotate( idx, -1 );
		Pop( 1 );
	}

	public void Replace( int idx )
	{
		Copy( -1, idx );
		Pop( 1 );
	}

	// TODO: locals, hooks, etc

	// lauxlib
	public void CheckVersion( double ver, int sz )
	{
		Assert.True( L != 0 );

		Lua.Module.luaL_checkversion_( L, ver, sz );
	}

	public void CheckVersion()
	{
		CheckVersion( 504, (8*16) + 8 );
	}

	public int GetMetafield( int obj, string e )
	{
		Assert.True( L != 0 );

		var (scope, pStr) = Lua.Module.ScopedString( e );
		try
		{
			return Lua.Module.luaL_getmetafield( L, obj, pStr );
		}
		finally
		{
			scope.Dispose();
		}
	}

	public int CallMeta( int obj, string e )
	{
		Assert.True( L != 0 );

		var (scope, pStr) = Lua.Module.ScopedString( e );
		try
		{
			return Lua.Module.luaL_callmeta( L, obj, pStr );
		}
		finally
		{
			scope.Dispose();
		}
	}

	//public string T
	public int ArgError( int arg, string extramsg )
	{
		Assert.True( L != 0 );

		var (scope, pStr) = Lua.Module.ScopedString( extramsg );
		try
		{
			return Lua.Module.luaL_argerror( L, arg, pStr );
		}
		finally
		{
			scope.Dispose();
		}
	}

	public int TypeError( int arg, string tname )
	{
		Assert.True( L != 0 );

		var (scope, pStr) = Lua.Module.ScopedString( tname );
		try
		{
			return Lua.Module.luaL_typeerror( L, arg, pStr );
		}
		finally
		{
			scope.Dispose();
		}
	}

	public int NewMetatable( string tname )
	{
		Assert.True( L != 0 );

		var (scope, pStr) = Lua.Module.ScopedString( tname );
		try
		{
			return Lua.Module.luaL_newmetatable( L, pStr );
		}
		finally
		{
			scope.Dispose();
		}
	}

	public void SetMetatable( string tname )
	{
		Assert.True( L != 0 );

		var (scope, pStr) = Lua.Module.ScopedString( tname );
		try
		{
			Lua.Module.luaL_setmetatable( L, pStr );
		}
		finally
		{
			scope.Dispose();
		}
	}

	public void SetFuncs( (string, CFunction)[] funcs, int nup )
	{
		// Format the array so C can take it.
		int arrSize = (funcs.Length + 1) * 8;
		var stringScopes = new (IDisposable scope, PTR ptr)[funcs.Length];

		PTR arr = Lua.Module.dex_builtin_malloc( arrSize );
		try
		{
			Dextr.Lua.Mem.Set( arr, 0, arrSize );

			for ( int i = 0; i < funcs.Length; i++ )
			{
				var (name, func) = funcs[i];
				stringScopes[i] = Lua.Module.ScopedString( name );

				PTR fPtr = GetFunctionPtr( ( object[] args ) => {
					PTR ctxPtr = (PTR)args[0];
					LuaContext ctx = ContextByPtr[ctxPtr];
					return func( ctx );
				} );

				Log.Info( $"lfunc '{name}' at ptr {fPtr} (arr {arrSize}, got {Dextr.Lua.Mem.GetObject<object>( fPtr )})" );
				Dextr.Lua.Mem.Store( arr + (i * 8) + 0, stringScopes[i].ptr );
				Dextr.Lua.Mem.Store( arr + (i * 8) + 4, fPtr );
			}

			Lua.Module.luaL_setfuncs( L, arr, nup );
		}
		finally
		{
			foreach ( var scope in stringScopes )
				scope.scope?.Dispose();

			Lua.Module.dex_builtin_free( arr );
		}
	}

	public void NewLibTable( (string, CFunction)[] funcs )
	{
		CreateTable( 0, funcs.Length );
	}

	public void NewLib( (string, CFunction)[] funcs )
	{
		CheckVersion();
		NewLibTable( funcs );
		SetFuncs( funcs, 0 );
	}
}
