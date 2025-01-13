#if !WHITELIST_MY_SHIT_PLEASE_ITS_BEEN_A_MONTH
global using UInt128 = System.Int128;
#endif // !WHITELIST_MY_SHIT_PLEASE_ITS_BEEN_A_MONTH
using RawPointer = int;
using SizeType = int;

using System;
using System.Buffers;
using System.Buffers.Binary;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.IO;
using System.IO.Compression;
using System.Linq;
using System.Numerics;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;
using NativeEngine;
using Sandbox;
using Sandbox.Diagnostics;



namespace Dextr {

/// <summary>
/// C#-side module implementation.
/// </summary>
internal partial class Lua
{
	
// // Used for __unwind.
// public class Resume : Exception
// {
// 	public object Object;

// 	public Resume( object obj )
// 	{
// 		Object = obj;
// 	}
// }

// Represents a constant array of zero objects.
public struct ZeroConst
{
	public long Size;

	public ZeroConst( long size )
	{
		Size = size;
	}
}

// public struct PtrWrap<T>
// {
// 	public static implicit operator PtrWrap(RawPointer p) => new PtrWrap(p);

// 	private RawPointer Addr;

// 	public PtrWrap(RawPointer ptr)
// 	{
// 		Addr = ptr;
// 	}
// }

public static class Mem
{
	private static bool HeapBaseLocked = false;
	private static RawPointer CurPtr;

	public static RawPointer StackBase { get; private set; } = 0;
	public static RawPointer StackEnd { get; private set; } = 0;
	private static RawPointer StackPtr;

	private static RawPointer FuncBase;
	private static RawPointer FuncEnd;
	private static MethodDescription[] FuncTable;
	
	public delegate object ExternalFunc( object[] args );
	private static Dictionary<string, int> FuncNameToIndex = new();

	// private const int StackBase = 1048576; // 65536

	private static byte[] Memory = new byte[16777216]; // 16777216
	private static ArrayPool<byte> SmallBufPool;

	private const int ObjectPoolBase = 0xFFFFFF;
	private static List<object> ObjectPool = new();

	// public static byte[] Raw => Memory;

	// public static RawPointer HeapBase => CurPtr;
	
	public static RawPointer StackPos => StackPtr;
	public static int Size => Memory.Length;

	private delegate void WriteUnmanagedTypeFunc( ref ByteStream stream, object value );

	private static Dictionary<Type, int> TypeSize = new();
	private static Dictionary<Type, WriteUnmanagedTypeFunc> WriteUnmanagedType = new();
	
	static Mem()
	{
		//GlobalMemory = ArrayPool<byte>.Create();
		Reset();

		// Default register types.
		RegisterType<bool>( 1 );
		RegisterType<char>( 1 );
		RegisterType<byte>( 1 );
		RegisterType<sbyte>( 1 );
		RegisterType<short>( 2 );
		RegisterType<ushort>( 2 );
		RegisterType<int>( 4 );
		RegisterType<uint>( 4 );
		RegisterType<float>( 4 );
		RegisterType<long>( 8 );
		RegisterType<ulong>( 8 );
		RegisterType<double>( 8 );

		RegisterType<Int128>( 16 );
		RegisterType<decimal>( 16 );
	}

	// Shorthand for various functions, used by minified modules.
	public static class Shorthand
	{
		[MethodImpl( MethodImplOptions.AggressiveInlining )]
		public static RawPointer _F( int index, string dbgName = null ) { return FuncPtr(index, dbgName); }

		[MethodImpl( MethodImplOptions.AggressiveInlining )]
		public static object _C( RawPointer fnPtr, params object[] args ) { return CallFuncPtrExplicit( fnPtr, args ); }

		[MethodImpl( MethodImplOptions.AggressiveInlining )]
		public static T _C<T>( RawPointer fnPtr, params object[] args ) { return (T)CallFuncPtrExplicit( fnPtr, args ); }

		[MethodImpl( MethodImplOptions.AggressiveInlining )]
		public static RawPointer _A( int size, ref int sp, int align = 0 ) { return StackAlloc(size, ref sp, align); }

		[MethodImpl( MethodImplOptions.AggressiveInlining )]
		public static void _P( int size ) { PopStack(size); }

		
		[MethodImpl( MethodImplOptions.AggressiveInlining )] public static void _S<T>( RawPointer offset, T data, int size ) where T : unmanaged { Store<T>(offset, data, size); }
		[MethodImpl( MethodImplOptions.AggressiveInlining )] public static void _S( RawPointer offset, in ZeroConst data, int size ) { Store(offset, data, size); }
		[MethodImpl( MethodImplOptions.AggressiveInlining )] public static void _S( RawPointer offset, ReadOnlySpan<byte> data, int size ) { Store(offset, data, size); }
		[MethodImpl( MethodImplOptions.AggressiveInlining )] public static void _S( RawPointer offset, bool value ) { Store(offset, value); }
		[MethodImpl( MethodImplOptions.AggressiveInlining )] public static void _S( RawPointer offset, sbyte value ) { Store(offset, value); }
		[MethodImpl( MethodImplOptions.AggressiveInlining )] public static void _S( RawPointer offset, short value ) { Store(offset, value); }
		[MethodImpl( MethodImplOptions.AggressiveInlining )] public static void _S( RawPointer offset, int value ) { Store(offset, value); }
		[MethodImpl( MethodImplOptions.AggressiveInlining )] public static void _S( RawPointer offset, long value ) { Store(offset, value); }
		[MethodImpl( MethodImplOptions.AggressiveInlining )] public static void _S( RawPointer offset, float value ) { Store(offset, value); }
		[MethodImpl( MethodImplOptions.AggressiveInlining )] public static void _S( RawPointer offset, double value ) { Store(offset, value); }


		[MethodImpl( MethodImplOptions.AggressiveInlining )] public static T _L<T>( RawPointer offset ) where T : unmanaged { return Load<T>(offset); }
		[MethodImpl( MethodImplOptions.AggressiveInlining )] public static bool _L1( RawPointer offset ) { return LoadBool(offset); }
		[MethodImpl( MethodImplOptions.AggressiveInlining )] public static sbyte _L8( RawPointer offset ) { return LoadByte(offset); }
		[MethodImpl( MethodImplOptions.AggressiveInlining )] public static short _L16( RawPointer offset ) { return LoadShort(offset); }
		[MethodImpl( MethodImplOptions.AggressiveInlining )] public static int _L32( RawPointer offset ) { return LoadInt(offset); }
		[MethodImpl( MethodImplOptions.AggressiveInlining )] public static long _L64( RawPointer offset ) { return LoadLong(offset); }
		[MethodImpl( MethodImplOptions.AggressiveInlining )] public static float _LS( RawPointer offset ) { return LoadSingle(offset); }
		[MethodImpl( MethodImplOptions.AggressiveInlining )] public static double _LD( RawPointer offset ) { return LoadDouble(offset); }
	}

	public static void Reset()
	{
		SmallBufPool = ArrayPool<byte>.Create();
		
		SetStackLimits( 1048576 , 0 );

		CurPtr = StackBase;
		StackPtr = StackBase;

		ObjectPool = new();
	}

	public static void Clear()
	{
		Memory = new byte[16777216];
		Reset();
	}

	public static RawPointer LockHeapBase()
	{
		if (HeapBaseLocked)
			Log.Error("Heap base already locked!");
		
		HeapBaseLocked = true;
		return CurPtr;
	}

	[MethodImpl( MethodImplOptions.AggressiveInlining )]
	public static RawPointer AlignPtr(RawPointer ptr, int align)
	{
		if (align <= 1) return ptr;
		
		if (ptr % align != 0)
			ptr += align - (ptr % align);
		return ptr;
	}

	[MethodImpl( MethodImplOptions.AggressiveInlining )]
	public static uint AlignUPtr(uint ptr, uint align)
	{
		if (align <= 1) return ptr;
		
		if (ptr % align != 0)
			ptr += align - (ptr % align);
		return ptr;
	}

	private const double MEMORY_GROWTH_GEOMETRIC_STEP = 0.20;

	// Specifies a cap for the maximum geometric overgrowth size, in bytes. Use
	// this value to constrain the geometric grow to not exceed a specific rate.
	// Pass MEMORY_GROWTH_GEOMETRIC_CAP=0 to disable the cap and allow unbounded
	// size increases.
	private const uint MEMORY_GROWTH_GEOMETRIC_CAP = 96*1024*1024;

	public static int Resize(RawPointer sSize)
	{
		uint newSize = /* StackBase + */ unchecked((uint)sSize);

		if (newSize <= Memory.Length)
		{
			Log.Error($"Cannot downsize heap!");
			return 0;
		}

		int cutDown = 1;
		double overGrownHeapSize = newSize * ( 1 + MEMORY_GROWTH_GEOMETRIC_STEP  / cutDown );
		overGrownHeapSize = Math.Min( overGrownHeapSize, newSize + MEMORY_GROWTH_GEOMETRIC_CAP );
		
		// Align to WASM page size.
		newSize = Mem.AlignUPtr((uint)overGrownHeapSize, (uint)(1 << 16));

		// Max size.
		if (newSize > 0X7FEFFFFF)
			newSize = 0X7FEFFFFF;

		Log.Info($"Heap resize: {Memory.Length} => {newSize}");

		// byte[] newMem = new byte[size];
		// Array.Copy( Memory, newMem, Memory.Length );
		// TODO: force a GC collect on the old memory?
		// Memory = newMem;

		Array.Resize(ref Memory, unchecked((int)newSize));
		return 1;
	}

	public static void RegisterType<T>(int size) where T : unmanaged
	{
		TypeSize[typeof( T )] = size;
		WriteUnmanagedType[typeof( T )] = ( ref ByteStream stream, object value ) => { stream.Write<T>( (T)value ); };
	}

	[MethodImpl( MethodImplOptions.AggressiveInlining )]
	public static Span<byte> Range(RawPointer start, int length)
	{
		// return Memory.AsSpan().Slice(start, length);
		return new Span<byte>( Memory, start, length );
	}

	[MethodImpl( MethodImplOptions.AggressiveInlining )]
	public static ReadOnlySpan<byte> ReadOnlyRange(RawPointer start, int length)
	{
		return new ReadOnlySpan<byte>( Memory, start, length );
	}

	public static void Copy(RawPointer dst, RawPointer src, int n)
	{
		Array.Copy( Memory, src, Memory, dst, n );
	}

	public static void Move(RawPointer dst, RawPointer src, int n)
	{
		// memmove region can overlap with itself. we need a temp buffer.
		byte[] tmp = SmallBufPool.Rent(n);
		Array.Copy( Memory, src, tmp, 0, n );
		Array.Copy( tmp, 0, Memory, dst, n );
		SmallBufPool.Return(tmp);
	}

	public static void Set(RawPointer dst, byte value, int length)
	{
		// Maybe this will get optimized to initblk?
		for ( RawPointer i = 0; i < length; i++ )
			Memory[dst + i] = value;
	}

	public static byte[] DecompressBase64(string str)
	{
		byte[] data = Convert.FromBase64String(str);
		using var ms = new MemoryStream(data);
		using var os = new MemoryStream();
		using var ds = new DeflateStream(ms, CompressionMode.Decompress);
		ds.CopyTo(os);
		return os.ToArray();
	}

	public static void SetInitialMemory(RawPointer funcBase, RawPointer globalBase, RawPointer heapBase, ReadOnlySpan<byte> initMemory)
	{
		Assert.True(funcBase == StackBase);
		Assert.True(initMemory.Length == (heapBase - funcBase));

		// Not necessary, just for sanity.
		CurPtr = heapBase;

		FuncBase = funcBase;
		FuncEnd = globalBase;

		// Ensure we have heapBase * 2 memory for programs with extremely large global sections.
		if (heapBase * 2 > Memory.Length)
		{
			Resize(heapBase * 2);
		}

		initMemory.CopyTo( new Span<byte>( Memory, (int)funcBase, initMemory.Length ) );
	}

	public static RawPointer Global( int size, int align = 0 )
	{
		if (HeapBaseLocked) Log.Error("Heap locked!");
		
		RawPointer ptr = AlignPtr(CurPtr, align);
		CurPtr = ptr + size;
		return ptr;
	}

	public static void InitFuncTable( int numFuncs, bool inline = false )
	{
		if (!inline)
		{
			if (HeapBaseLocked) Log.Error("Heap locked!");
			FuncBase = CurPtr;

			// Functions aren't actually stored. We just define it as a memory range for simple access.
			CurPtr += numFuncs;

			FuncEnd = CurPtr;
		}

		FuncTable = new MethodDescription[numFuncs];
	}

	public static void RegisterFunc( int index, Type modType, string funcName )
	{
		// FuncTable[index] = TypeLibrary.GetType( modType ).GetMethod( funcName );
		FuncTable[index] = TypeLibrary.GetType( modType ).Methods.FirstOrDefault((MethodDescription x) => string.Equals(x.Name, funcName));
		
		if (FuncTable[index] == null)
		{
			Log.Warning($"Missing function: \"{funcName}\"");
		}
		else
		{
			FuncNameToIndex[funcName] = index;
		}

		// CurPtr++;
	}
	
	public static int GetFuncIndex(string func)
	{
		return FuncNameToIndex[func];
	}
	
	public static RawPointer FuncPtr( int index, string dbgName = null )
	{
		return FuncBase + index;
	}
	
	[MethodImpl( MethodImplOptions.AggressiveInlining )]
	public static object CallFuncPtr( /* object mod, */ RawPointer fnPtr, params object[] args )
	{
		return CallFuncPtrExplicit( fnPtr, args );
	}

	[MethodImpl( MethodImplOptions.AggressiveInlining )]
	public static T CallFuncPtr<T>( /* object mod, */ RawPointer fnPtr, params object[] args )
	{
		return (T)CallFuncPtrExplicit( fnPtr, args );
	}

	public static async Task CallFuncPtrAsync( RawPointer fnPtr, params object[] args )
	{
		object ret = CallFuncPtrExplicit( fnPtr, args );
		if (ret is Task t)
		{
			await t;
		}
	}

	public static async Task<T> CallFuncPtrAsync<T>( RawPointer fnPtr, params object[] args )
	{
		object ret = CallFuncPtrExplicit( fnPtr, args );
		if (ret is Task<T> t)
		{
			return await t;
		}
		else
		{
			return (T)ret;
		}
	}

	public static object CallFuncPtrExplicit( RawPointer fnPtr, object[] args )
	{
		if (fnPtr < FuncBase || fnPtr >= FuncEnd)
		{
			// Is this an external call?
			if (TryGetObject( fnPtr, out ExternalFunc ext ))
			{
				return ext(args);
			}
			else
			{
				throw new Exception( $"Invalid function pointer {fnPtr}!!!" );
			}
		}

		MethodDescription fn = FuncTable[fnPtr - FuncBase];
		if (fn == null)
			Log.Error("Empty function!");

		// try {
		return fn.InvokeWithReturn<object>(ThisModule, args);
		// }
		// catch (Exception e) {
		// 	Log.Warning($"Failed to call function pointer '{fn.Title}'");
		// 	throw e;
		// }
	}

	public static object CallFuncPtrDefaultArgs( RawPointer fnPtr )
	{
		if (fnPtr < FuncBase || fnPtr >= FuncEnd)
		{
			throw new Exception( $"Invalid function pointer {fnPtr}!!!" );
		}

		MethodDescription fn = FuncTable[fnPtr - FuncBase];
		if (fn == null)
			Log.Error("Empty function!");

		object[] defaultArgs = new object[fn.Parameters.Length];

		for (int i = 0; i < defaultArgs.Length; i++)
			defaultArgs[i] = TypeLibrary.GetType( fn.Parameters[i].ParameterType ).Create<object>();

		return fn.InvokeWithReturn<object>(ThisModule, defaultArgs);
	}

	public static RawPointer NewObject<T>( params object[] args )
	{
		object obj = (object)TypeLibrary.GetType( typeof( T ) ).Create<T>( args );
		if (obj == null)
			throw new Exception($"NewObject: Failed to instantiate type {typeof( T )}");
		
		return AllocNewObject( obj );
	}

	public static RawPointer AllocNewObject( object obj )
	{
		// TODO: if this gets exhausted a lot we should switch to a free list.
		for (int i = 0; i < ObjectPool.Count; i++)
		{
			if (ObjectPool[i] == null)
			{
				ObjectPool[i] = obj;
				return ObjectPoolBase + i;
			}
		}

		RawPointer idx = ObjectPoolBase + ObjectPool.Count;
		ObjectPool.Add(obj);
		return idx;
	}

	public static RawPointer AllocNewFunction( ExternalFunc func )
	{
		return AllocNewObject( func );
	}

	public static bool TryGetObject<T>( RawPointer index, out T value )
	{
		if (index >= ObjectPoolBase && (index - ObjectPoolBase) < ObjectPool.Count)
		{
			if ( ObjectPool[index - ObjectPoolBase] is T found )
			{
				value = found;
				return true;
			}
		}

		value = default;
		return false;
	}

	public static T GetObject<T>( RawPointer index )
	{
		return (T)ObjectPool[index - ObjectPoolBase];
	}

	public static void FreeObject( RawPointer index )
	{
		if (ObjectPool[index - ObjectPoolBase] != null)
			throw new Exception("Bad object free!");
		
		// TODO: call dispose?
		ObjectPool[index - ObjectPoolBase] = null;
	}

	public static T TryCast<T>(object obj)
	{
		if (obj is T val)
			return val;
		
		return default(T);
	}

	[MethodImpl( MethodImplOptions.AggressiveInlining )]
	public static RawPointer StackAlloc( int size, ref int sp, int align = 0 )
	{
		StackPtr -= size;
		sp += size;

		if (align > 1)
		{
			if (StackPtr % align != 0)
			{
				sp += (StackPtr % align);
				StackPtr -= (StackPtr % align);
			}
		}

		return StackPtr;
	}

	[MethodImpl( MethodImplOptions.AggressiveInlining )]
	public static void PopStack( int size )
	{
		StackPtr += size;
	}

	[MethodImpl( MethodImplOptions.AggressiveInlining )]
	public static RawPointer StackSave()
	{
		return StackPtr;
	}

	[MethodImpl( MethodImplOptions.AggressiveInlining )]
	public static void StackRestore(RawPointer ptr)
	{
		StackPtr = ptr;
	}

	public static void SetStackLimits(RawPointer stackBase, RawPointer stackEnd)
	{
		StackBase = stackBase;
		StackEnd = stackEnd;
	}

	public static T ArrConst<T>( in string base64 ) where T : unmanaged
	{
		// Data should be length prefixed.
		byte[] data = Convert.FromBase64String( base64 );
		var stream = ByteStream.CreateReader( data );

		return stream.Read<T>();
	}

#if HEAP_CHECKS
	private static void CheckStoreOffset(RawPointer offset)
	{
		if ( offset == 0 ) Log.Error( $"STORE TO NULLPTR!!!" );
		if ( offset < 0 || offset >= Memory.Length ) Log.Error($"BAD STORE from {offset}! Memory size is {Memory.Length}");
	}
#endif // HEAP_CHECKS

	public static void Store( RawPointer offset, in ZeroConst data, int size )
	{
		#if HEAP_CHECKS
		CheckStoreOffset(offset);
		#endif // HEAP_CHECKS
		
		// var str = ByteStream.Create( size );
		// str.ToSpan().CopyTo( new Span<byte>( Memory, (int)offset, size ) );
		Set(offset, 0, size);
	}

	[MethodImpl( MethodImplOptions.AggressiveInlining )]
	public static void Store<T>( RawPointer offset, T data, int size ) where T : unmanaged
	{
		#if HEAP_CHECKS
		CheckStoreOffset(offset);
		#endif // HEAP_CHECKS

		// Stack.
		var str = ByteStream.Create( size );
		str.Write( data );
		if ( str.Position > size )
			Log.Error( $"Store overwrite! {str.Position} (should be {size})" );

		str.ToSpan().CopyTo( new Span<byte>( Memory, (int)offset, size ) );
	}

	[MethodImpl( MethodImplOptions.AggressiveInlining )]
	public static void Store( RawPointer offset, ReadOnlySpan<byte> data, int size )
	{
		#if HEAP_CHECKS
		CheckStoreOffset(offset);
		#endif // HEAP_CHECKS
		
		data.CopyTo( new Span<byte>( Memory, (int)offset, size ) );
	}

	// Type-specific store overloads.
	[MethodImpl( MethodImplOptions.AggressiveInlining | MethodImplOptions.AggressiveOptimization )]
	public static void Store( RawPointer offset, bool value )
	{
		#if HEAP_CHECKS
		CheckStoreOffset(offset);
		#endif // HEAP_CHECKS
		
		Memory[offset] = unchecked((byte)(value ? 1 : 0));
	}

	[MethodImpl( MethodImplOptions.AggressiveInlining | MethodImplOptions.AggressiveOptimization )]
	public static void Store( RawPointer offset, sbyte value )
	{
		#if HEAP_CHECKS
		CheckStoreOffset(offset);
		#endif // HEAP_CHECKS
		
		Memory[offset] = unchecked((byte)value);
	}

	[MethodImpl( MethodImplOptions.AggressiveInlining | MethodImplOptions.AggressiveOptimization )]
	public static void Store( RawPointer offset, short data )
	{
		#if HEAP_CHECKS
		CheckStoreOffset(offset);
		#endif // HEAP_CHECKS
		
		#if DISABLE_BINARY_PRIMITIVES
		Memory[offset+0] = (byte)(data);
		Memory[offset+1] = (byte)(data >> 8);
		#else // !DISABLE_BINARY_PRIMITIVES
		BinaryPrimitives.WriteInt16LittleEndian(Range(offset, 2), data);
		#endif // !DISABLE_BINARY_PRIMITIVES
	}

	[MethodImpl( MethodImplOptions.AggressiveInlining | MethodImplOptions.AggressiveOptimization )]
	public static void Store( RawPointer offset, int data )
	{
		#if HEAP_CHECKS
		CheckStoreOffset(offset);
		#endif // HEAP_CHECKS
		
		#if DISABLE_BINARY_PRIMITIVES
		Memory[offset+0] = (byte)(data);
		Memory[offset+1] = (byte)(data >> 8);
		Memory[offset+2] = (byte)(data >> 16);
		Memory[offset+3] = (byte)(data >> 24);
		#else // !DISABLE_BINARY_PRIMITIVES
		BinaryPrimitives.WriteInt32LittleEndian(Range(offset, 4), data);
		#endif // !DISABLE_BINARY_PRIMITIVES
	}


	[MethodImpl( MethodImplOptions.AggressiveInlining | MethodImplOptions.AggressiveOptimization )]
	public static void Store( RawPointer offset, long data )
	{
		#if HEAP_CHECKS
		CheckStoreOffset(offset);
		#endif // HEAP_CHECKS
		
		#if DISABLE_BINARY_PRIMITIVES
		Memory[offset+0] = (byte)(data);
		Memory[offset+1] = (byte)(data >> 8);
		Memory[offset+2] = (byte)(data >> 16);
		Memory[offset+3] = (byte)(data >> 24);
		Memory[offset+4] = (byte)(data >> 32);
		Memory[offset+5] = (byte)(data >> 40);
		Memory[offset+6] = (byte)(data >> 48);
		Memory[offset+7] = (byte)(data >> 56);
		#else // !DISABLE_BINARY_PRIMITIVES
		BinaryPrimitives.WriteInt64LittleEndian(Range(offset, 8), data);
		#endif // !DISABLE_BINARY_PRIMITIVES
	}

	/*
	// Not supported yet.
	[MethodImpl( MethodImplOptions.AggressiveInlining | MethodImplOptions.AggressiveOptimization )]
	public static void Store( RawPointer offset, Int128 data )
	{
		#if HEAP_CHECKS
		CheckStoreOffset(offset);
		#endif // HEAP_CHECKS
		
		#if DISABLE_BINARY_PRIMITIVES
		throw new Exception("DISABLE_BINARY_PRIMITIVES: Not supported!");
		#else // !DISABLE_BINARY_PRIMITIVES
		BinaryPrimitives.WriteInt128LittleEndian(Range(offset, 16), data);
		#endif // !DISABLE_BINARY_PRIMITIVES
	}
	*/

	
	[MethodImpl( MethodImplOptions.AggressiveInlining | MethodImplOptions.AggressiveOptimization )]
	public static void Store( RawPointer offset, float data )
	{
		#if HEAP_CHECKS
		CheckStoreOffset(offset);
		#endif // HEAP_CHECKS
		
		#if DISABLE_BINARY_PRIMITIVES
		throw new Exception("DISABLE_BINARY_PRIMITIVES: Not supported!");
		#else // !DISABLE_BINARY_PRIMITIVES
		BinaryPrimitives.WriteSingleLittleEndian(Range(offset, 4), data);
		#endif // !DISABLE_BINARY_PRIMITIVES
	}

	[MethodImpl( MethodImplOptions.AggressiveInlining | MethodImplOptions.AggressiveOptimization )]
	public static void Store( RawPointer offset, double data )
	{
		#if HEAP_CHECKS
		CheckStoreOffset(offset);
		#endif // HEAP_CHECKS
		
		#if DISABLE_BINARY_PRIMITIVES
		throw new Exception("DISABLE_BINARY_PRIMITIVES: Not supported!");
		#else // !DISABLE_BINARY_PRIMITIVES
		BinaryPrimitives.WriteDoubleLittleEndian(Range(offset, 8), data);
		#endif // !DISABLE_BINARY_PRIMITIVES
	}

	[MethodImpl( MethodImplOptions.AggressiveInlining | MethodImplOptions.AggressiveOptimization )]
	public static void StoreByte(RawPointer offset, byte value)
	{
		#if HEAP_CHECKS
		CheckStoreOffset(offset);
		#endif // HEAP_CHECKS
		
		Memory[offset] = value;
	}

	// [MethodImpl( MethodImplOptions.AggressiveInlining )]
	#if HEAP_CHECKS
	private static void CheckOffset(RawPointer offset)
	{
		if ( offset == 0 ) Log.Error( $"LOAD FROM NULLPTR!!!" );
		if ( offset < 0 || offset >= Memory.Length ) Log.Error($"BAD LOAD from {offset}! Memory size is {Memory.Length}");
	}
	#endif // #if HEAP_CHECKS

	[MethodImpl( MethodImplOptions.AggressiveInlining )]
	public static T Load<T>( RawPointer offset ) where T : unmanaged
	{
		#if HEAP_CHECKS
		CheckOffset(offset);
		#endif // HEAP_CHECKS

		var str = ByteStream.CreateReader( Memory );
		str.Position = (int)offset;
		return str.Read<T>();
	}

	// Type-specific load overloads.
	[MethodImpl( MethodImplOptions.AggressiveInlining | MethodImplOptions.AggressiveOptimization )]
	public static bool LoadBool( RawPointer offset )
	{
		#if HEAP_CHECKS
		CheckOffset(offset);
		#endif // HEAP_CHECKS
		
		return Memory[offset] != 0;
	}

	[MethodImpl( MethodImplOptions.AggressiveInlining | MethodImplOptions.AggressiveOptimization )]
	public static sbyte LoadByte( RawPointer offset )
	{
		#if HEAP_CHECKS
		CheckOffset(offset);
		#endif // HEAP_CHECKS
		
		return unchecked((sbyte)Memory[offset]);
	}

	[MethodImpl( MethodImplOptions.AggressiveInlining | MethodImplOptions.AggressiveOptimization )]
	public static short LoadShort( RawPointer offset )
	{
		#if HEAP_CHECKS
		CheckOffset(offset);
		#endif // HEAP_CHECKS
		
		#if DISABLE_BINARY_PRIMITIVES
		return (short)((Memory[offset+0])
			| (Memory[offset+1] << 8));
		#else // !DISABLE_BINARY_PRIMITIVES
		return BinaryPrimitives.ReadInt16LittleEndian(ReadOnlyRange(offset, 2));
		#endif // !DISABLE_BINARY_PRIMITIVES
	}

	[MethodImpl( MethodImplOptions.AggressiveInlining | MethodImplOptions.AggressiveOptimization )]
	public static int LoadInt( RawPointer offset )
	{
		#if HEAP_CHECKS
		CheckOffset(offset);
		#endif // HEAP_CHECKS
		
		#if DISABLE_BINARY_PRIMITIVES
		return (int)(Memory[offset+0])
			| (int)(Memory[offset+1] << 8)
			| (int)(Memory[offset+2] << 16)
			| (int)(Memory[offset+3] << 24);
		#else // !DISABLE_BINARY_PRIMITIVES
		return BinaryPrimitives.ReadInt32LittleEndian(ReadOnlyRange(offset, 4));
		#endif // !DISABLE_BINARY_PRIMITIVES
	}


	[MethodImpl( MethodImplOptions.AggressiveInlining | MethodImplOptions.AggressiveOptimization )]
	public static long LoadLong( RawPointer offset )
	{
		#if HEAP_CHECKS
		CheckOffset(offset);
		#endif // HEAP_CHECKS
		
		#if DISABLE_BINARY_PRIMITIVES
		return (long)(Memory[offset+0])
			| (long)(Memory[offset+1]) << 8
			| (long)(Memory[offset+2]) << 16
			| (long)(Memory[offset+3]) << 24
			| (long)(Memory[offset+4]) << 32
			| (long)(Memory[offset+5]) << 40
			| (long)(Memory[offset+6]) << 48
			| (long)(Memory[offset+7]) << 56;
		#else // !DISABLE_BINARY_PRIMITIVES
		return BinaryPrimitives.ReadInt64LittleEndian(ReadOnlyRange(offset, 8));
		#endif // !DISABLE_BINARY_PRIMITIVES
	}

	/*
	// Not supported yet.
	[MethodImpl( MethodImplOptions.AggressiveInlining | MethodImplOptions.AggressiveOptimization )]
	public static Int128 LoadInt128( RawPointer offset )
	{
		#if HEAP_CHECKS
		CheckOffset(offset);
		#endif // HEAP_CHECKS
		
		#if DISABLE_BINARY_PRIMITIVES
		throw new Exception("DISABLE_BINARY_PRIMITIVES: Not supported!");
		#else // !DISABLE_BINARY_PRIMITIVES
		return BinaryPrimitives.ReadInt128LittleEndian(ReadOnlyRange(offset, 16));
		#endif // !DISABLE_BINARY_PRIMITIVES
	}
	*/
	
	[MethodImpl( MethodImplOptions.AggressiveInlining | MethodImplOptions.AggressiveOptimization )]
	public static float LoadSingle( RawPointer offset )
	{
		#if HEAP_CHECKS
		CheckOffset(offset);
		#endif // HEAP_CHECKS
		
		#if DISABLE_BINARY_PRIMITIVES
		throw new Exception("DISABLE_BINARY_PRIMITIVES: Not supported!");
		#else // !DISABLE_BINARY_PRIMITIVES
		return BinaryPrimitives.ReadSingleLittleEndian(ReadOnlyRange(offset, 4));
		#endif // !DISABLE_BINARY_PRIMITIVES
	}

	
	[MethodImpl( MethodImplOptions.AggressiveInlining | MethodImplOptions.AggressiveOptimization )]
	public static double LoadDouble( RawPointer offset )
	{
		#if HEAP_CHECKS
		CheckOffset(offset);
		#endif // HEAP_CHECKS
		
		#if DISABLE_BINARY_PRIMITIVES
		throw new Exception("DISABLE_BINARY_PRIMITIVES: Not supported!");
		#else // !DISABLE_BINARY_PRIMITIVES
		return BinaryPrimitives.ReadDoubleLittleEndian(ReadOnlyRange(offset, 8));
		#endif // !DISABLE_BINARY_PRIMITIVES
	}

	[MethodImpl( MethodImplOptions.AggressiveInlining )]
	public static byte[] Load(RawPointer offset, int len)
	{
		#if HEAP_CHECKS
		if ( offset == 0 )
			Log.Error( $"LOAD FROM NULLPTR!!!" );
		#endif // HEAP_CHECKS
		
		byte[] arr = new byte[len];
		Array.Copy( Memory, offset, arr, 0, len );
		return arr;
	}

	public static To BitcastSlow<From, To>( in From value, int size )
		where From : unmanaged
		where To : unmanaged
	{
		var str = ByteStream.Create( size );
		str.Write( value );
		var expectedLen = str.Position;

		str.Position = 0;
		To res = str.Read<To>();

		// NOTE: we currently have a failure case where boolean vectors (expecting to be packed) get padded out,
		// because they're backed by a struct.
		if (str.Position != expectedLen)
			Log.Error($"Bitcast failed! {typeof(From)} --> {typeof(To)}");

		return res;
	}

	
	[MethodImpl( MethodImplOptions.AggressiveInlining )]
	public static sbyte BitcastPack( int width, params sbyte[] values )
		// where T : unmanaged, IBinaryInteger<T>
	{
		sbyte res = default;

		for (int i = 0; i < values.Length; i++)
		{
			res <<= width;
			res |= values[i];
		}

		return res;
	}
	
	[MethodImpl( MethodImplOptions.AggressiveInlining )]
	public static short BitcastPack( int width, params short[] values )
		// where T : unmanaged, IBinaryInteger<T>
	{
		short res = default;

		for (int i = 0; i < values.Length; i++)
		{
			res <<= width;
			res |= values[i];
		}

		return res;
	}
	
	[MethodImpl( MethodImplOptions.AggressiveInlining )]
	public static int BitcastPack( int width, params int[] values )
		// where T : unmanaged, IBinaryInteger<T>
	{
		int res = default;

		for (int i = 0; i < values.Length; i++)
		{
			res <<= width;
			res |= values[i];
		}

		return res;
	}
	
	[MethodImpl( MethodImplOptions.AggressiveInlining )]
	public static long BitcastPack( int width, params long[] values )
		// where T : unmanaged, IBinaryInteger<T>
	{
		long res = default;

		for (int i = 0; i < values.Length; i++)
		{
			res <<= width;
			res |= values[i];
		}

		return res;
	}
	

	
	[MethodImpl( MethodImplOptions.AggressiveInlining )]
	public static sbyte[] BitcastUnpack( sbyte value, int num, int width, sbyte mask )
		// where T : unmanaged, IBinaryInteger<T>
	{
		sbyte[] res = new sbyte[num];

		for (int i = num - 1; i >= 0; i++)
		{
			res[i] = (sbyte)(value & mask);
			value >>= width;
		}

		return res;
	}
	
	[MethodImpl( MethodImplOptions.AggressiveInlining )]
	public static short[] BitcastUnpack( short value, int num, int width, short mask )
		// where T : unmanaged, IBinaryInteger<T>
	{
		short[] res = new short[num];

		for (int i = num - 1; i >= 0; i++)
		{
			res[i] = (short)(value & mask);
			value >>= width;
		}

		return res;
	}
	
	[MethodImpl( MethodImplOptions.AggressiveInlining )]
	public static int[] BitcastUnpack( int value, int num, int width, int mask )
		// where T : unmanaged, IBinaryInteger<T>
	{
		int[] res = new int[num];

		for (int i = num - 1; i >= 0; i++)
		{
			res[i] = (int)(value & mask);
			value >>= width;
		}

		return res;
	}
	
	[MethodImpl( MethodImplOptions.AggressiveInlining )]
	public static long[] BitcastUnpack( long value, int num, int width, long mask )
		// where T : unmanaged, IBinaryInteger<T>
	{
		long[] res = new long[num];

		for (int i = num - 1; i >= 0; i++)
		{
			res[i] = (long)(value & mask);
			value >>= width;
		}

		return res;
	}
	

	public static int GetUnmanagedTypeSize( Type type )
	{
		if ( TypeSize.TryGetValue( type, out int size ) )
			return size;

		// This is absurd. I wish the whitelist wasn't so stupid.
		throw new Exception( $"Unregistered type {type}!" );
	}

	public static void DoWriteUnmanagedType( ref ByteStream str, object obj )
	{
		if ( WriteUnmanagedType.TryGetValue( obj.GetType(), out WriteUnmanagedTypeFunc fn ) )
		{
			fn( ref str, obj );
			return;
		}

		throw new Exception( $"Unregistered type for object {obj}!" );
	}

	public static void VaStart( RawPointer va_list, ref int sp, object[] args )
	{
		if ( va_list == 0 )
		{
			Log.Error( "Bad vastart" );
			return;
		}

		if ( args.Length == 0 )
		{
			// va_start always stores a pointer?
			Store<RawPointer>( va_list, StackPtr, 4 );
			return;
		}

		int totalSize = 0;
		foreach ( var arg in args )
		{
			int typeSize = GetUnmanagedTypeSize( arg.GetType() );

			// Types need to be on an aligned pointer wrt their size.
			totalSize = AlignPtr(totalSize, typeSize);

			totalSize += typeSize;
		}

		var str = ByteStream.Create( totalSize );
		int offset = 0;
		foreach ( var arg in args )
		{
			int typeSize = GetUnmanagedTypeSize( arg.GetType() );
			int newOffset = AlignPtr(offset, typeSize);
			int padding = newOffset - offset;
			offset = newOffset + typeSize;

			while (padding-- != 0) str.Write((sbyte)0);
			
			// Fill in element values.
			DoWriteUnmanagedType( ref str, arg );
		}

		if ( str.Position != totalSize )
			Log.Error( $"VaStart overwrite! {str.Position} (should be {totalSize})" );

		// Place the data on the stack.
		RawPointer newStackBase = StackPtr - totalSize;

		// Align to 8 bytes.
		// TODO: maybe 16 for int128?
		newStackBase -= (newStackBase % 8);
		sp += StackPtr - newStackBase;

		StackPtr = newStackBase;

		str.ToSpan().CopyTo( new Span<byte>( Memory, (int)StackPtr, totalSize ) );

		// Save the stack pointer value into the va_list struct.
		Store<RawPointer>( va_list, StackPtr, 4 );
	}

	public static void VaEnd( RawPointer va_list )
	{
		// Variadic args are stored on the stack, nothing is necessary here.
	}

	public static void VaCopy( RawPointer dst, RawPointer src )
	{
		// Just copy the struct pointer member over.
		// Not sure if this is accurate behavior.
		RawPointer ptr = Load<RawPointer>( src );
		// if (ptr != 0)
		{
			Store<RawPointer>( dst, ptr, 4 );
		}
	}

	private const int uint_SIZE = 32;
	private const int ulong_SIZE = 64;

	
	[MethodImpl( MethodImplOptions.AggressiveInlining | MethodImplOptions.AggressiveOptimization )]
	public static int Ctlz(uint x, int bw)
	{
		int val = BitOperations.LeadingZeroCount(x);

		// Simple case. Should get inlined out.
		if (bw == uint_SIZE) return val;

		// Ignore extra leading zeros.
		val -= (uint_SIZE - bw);
		#if DEBUG
		if (val < 0) throw new Exception("Bad ctlz!");
		#endif // DEBUG
		return val;
	}
	
	[MethodImpl( MethodImplOptions.AggressiveInlining | MethodImplOptions.AggressiveOptimization )]
	public static int Ctlz(ulong x, int bw)
	{
		int val = BitOperations.LeadingZeroCount(x);

		// Simple case. Should get inlined out.
		if (bw == ulong_SIZE) return val;

		// Ignore extra leading zeros.
		val -= (ulong_SIZE - bw);
		#if DEBUG
		if (val < 0) throw new Exception("Bad ctlz!");
		#endif // DEBUG
		return val;
	}
	

	
	[MethodImpl( MethodImplOptions.AggressiveInlining | MethodImplOptions.AggressiveOptimization )]
	public static int Cttz(uint x, int bw)
	{
		int val = BitOperations.TrailingZeroCount(x);

		// Simple case. Should get inlined out.
		if (bw == uint_SIZE) return val;

		if (val > bw) val = bw;
		return val;
	}
	
	[MethodImpl( MethodImplOptions.AggressiveInlining | MethodImplOptions.AggressiveOptimization )]
	public static int Cttz(ulong x, int bw)
	{
		int val = BitOperations.TrailingZeroCount(x);

		// Simple case. Should get inlined out.
		if (bw == ulong_SIZE) return val;

		if (val > bw) val = bw;
		return val;
	}
	

	
	[MethodImpl( MethodImplOptions.AggressiveInlining | MethodImplOptions.AggressiveOptimization )]
	public static int Ctpop(uint x, int bw)
	{
		#if DEBUG
		// We don't currently support nonstandard ints here.
		if (bw != 8 && bw != 16 && bw != 32 && bw != 64) throw new Exception("Bad ctpop!");
		#endif // DEBUG

		return BitOperations.PopCount(x);
	}
	
	[MethodImpl( MethodImplOptions.AggressiveInlining | MethodImplOptions.AggressiveOptimization )]
	public static int Ctpop(ulong x, int bw)
	{
		#if DEBUG
		// We don't currently support nonstandard ints here.
		if (bw != 8 && bw != 16 && bw != 32 && bw != 64) throw new Exception("Bad ctpop!");
		#endif // DEBUG

		return BitOperations.PopCount(x);
	}
	

	
	[MethodImpl( MethodImplOptions.AggressiveInlining | MethodImplOptions.AggressiveOptimization )]
	public static uint Fshl(uint hi, uint lo, uint amt, int bw)
	{
		// PromoteIntRes_FunnelShift
		// https://github.com/llvm/llvm-project/blob/d6e65a66095cc3c93ea78669bc41d0885780e8ea/llvm/lib/CodeGen/SelectionDAG/LegalizeIntegerTypes.cpp#L1537
		
		uint mask = (((uint)1) << bw) - 1;

		hi = (hi << bw);
		uint v = (hi | lo);
		v = v << (int)(amt % (uint)bw);
		return (v >>> bw) & mask;
	}
	
	[MethodImpl( MethodImplOptions.AggressiveInlining | MethodImplOptions.AggressiveOptimization )]
	public static ulong Fshl(ulong hi, ulong lo, ulong amt, int bw)
	{
		// PromoteIntRes_FunnelShift
		// https://github.com/llvm/llvm-project/blob/d6e65a66095cc3c93ea78669bc41d0885780e8ea/llvm/lib/CodeGen/SelectionDAG/LegalizeIntegerTypes.cpp#L1537
		
		ulong mask = (((ulong)1) << bw) - 1;

		hi = (hi << bw);
		ulong v = (hi | lo);
		v = v << (int)(amt % (ulong)bw);
		return (v >>> bw) & mask;
	}
	
	[MethodImpl( MethodImplOptions.AggressiveInlining | MethodImplOptions.AggressiveOptimization )]
	public static UInt128 Fshl(UInt128 hi, UInt128 lo, UInt128 amt, int bw)
	{
		// PromoteIntRes_FunnelShift
		// https://github.com/llvm/llvm-project/blob/d6e65a66095cc3c93ea78669bc41d0885780e8ea/llvm/lib/CodeGen/SelectionDAG/LegalizeIntegerTypes.cpp#L1537
		
		UInt128 mask = (((UInt128)1) << bw) - 1;

		hi = (hi << bw);
		UInt128 v = (hi | lo);
		v = v << (int)(amt % (UInt128)bw);
		return (v >>> bw) & mask;
	}
	

	
	[MethodImpl( MethodImplOptions.AggressiveInlining | MethodImplOptions.AggressiveOptimization )]
	public static uint Fshr(uint hi, uint lo, uint amt, int bw)
	{
		// PromoteIntRes_FunnelShift
		// https://github.com/llvm/llvm-project/blob/d6e65a66095cc3c93ea78669bc41d0885780e8ea/llvm/lib/CodeGen/SelectionDAG/LegalizeIntegerTypes.cpp#L1537
		
		uint mask = (((uint)1) << bw) - 1;
		
		hi = (hi << bw);
		uint v = (hi | lo);
		v = v >>> (int)(amt % (uint)bw);
		return (v & mask);
	}
	
	[MethodImpl( MethodImplOptions.AggressiveInlining | MethodImplOptions.AggressiveOptimization )]
	public static ulong Fshr(ulong hi, ulong lo, ulong amt, int bw)
	{
		// PromoteIntRes_FunnelShift
		// https://github.com/llvm/llvm-project/blob/d6e65a66095cc3c93ea78669bc41d0885780e8ea/llvm/lib/CodeGen/SelectionDAG/LegalizeIntegerTypes.cpp#L1537
		
		ulong mask = (((ulong)1) << bw) - 1;
		
		hi = (hi << bw);
		ulong v = (hi | lo);
		v = v >>> (int)(amt % (ulong)bw);
		return (v & mask);
	}
	
	[MethodImpl( MethodImplOptions.AggressiveInlining | MethodImplOptions.AggressiveOptimization )]
	public static UInt128 Fshr(UInt128 hi, UInt128 lo, UInt128 amt, int bw)
	{
		// PromoteIntRes_FunnelShift
		// https://github.com/llvm/llvm-project/blob/d6e65a66095cc3c93ea78669bc41d0885780e8ea/llvm/lib/CodeGen/SelectionDAG/LegalizeIntegerTypes.cpp#L1537
		
		UInt128 mask = (((UInt128)1) << bw) - 1;
		
		hi = (hi << bw);
		UInt128 v = (hi | lo);
		v = v >>> (int)(amt % (UInt128)bw);
		return (v & mask);
	}
	

	
	[MethodImpl( MethodImplOptions.AggressiveInlining )]
	public static sbyte BitReverse(sbyte val, int size)
		// where T : unmanaged, INumber<T>
	{
		sbyte reversed = 0;
		for (int iBit = 0; iBit < size; iBit++)
		{
			reversed <<= 1;
			reversed |= (sbyte)(val & 1);
			val >>= 1;
		}
		return reversed;
	}
	
	[MethodImpl( MethodImplOptions.AggressiveInlining )]
	public static short BitReverse(short val, int size)
		// where T : unmanaged, INumber<T>
	{
		short reversed = 0;
		for (int iBit = 0; iBit < size; iBit++)
		{
			reversed <<= 1;
			reversed |= (short)(val & 1);
			val >>= 1;
		}
		return reversed;
	}
	
	[MethodImpl( MethodImplOptions.AggressiveInlining )]
	public static int BitReverse(int val, int size)
		// where T : unmanaged, INumber<T>
	{
		int reversed = 0;
		for (int iBit = 0; iBit < size; iBit++)
		{
			reversed <<= 1;
			reversed |= (int)(val & 1);
			val >>= 1;
		}
		return reversed;
	}
	
	[MethodImpl( MethodImplOptions.AggressiveInlining )]
	public static long BitReverse(long val, int size)
		// where T : unmanaged, INumber<T>
	{
		long reversed = 0;
		for (int iBit = 0; iBit < size; iBit++)
		{
			reversed <<= 1;
			reversed |= (long)(val & 1);
			val >>= 1;
		}
		return reversed;
	}
	

	// Atomics.
	// TODO: Find a way around this without something stupid like locking the entire heap.
	// We might need a dedicated address space for atomic variables.
	
	[MethodImpl( MethodImplOptions.AggressiveInlining )]
	public static (sbyte, bool) AtomicCmpXchg(RawPointer addr, sbyte cmp, sbyte newVal, int size)
		// where T : unmanaged, INumber<T>
	{
		lock (Memory)
		{
			sbyte tmp = Mem.Load<sbyte>(addr);
			bool didXchg = (tmp == cmp);
			if (didXchg)
			{
				Mem.Store<sbyte>(addr, newVal, size);
			}
			return (tmp, didXchg);
		}
	}
	
	[MethodImpl( MethodImplOptions.AggressiveInlining )]
	public static (short, bool) AtomicCmpXchg(RawPointer addr, short cmp, short newVal, int size)
		// where T : unmanaged, INumber<T>
	{
		lock (Memory)
		{
			short tmp = Mem.Load<short>(addr);
			bool didXchg = (tmp == cmp);
			if (didXchg)
			{
				Mem.Store<short>(addr, newVal, size);
			}
			return (tmp, didXchg);
		}
	}
	
	[MethodImpl( MethodImplOptions.AggressiveInlining )]
	public static (int, bool) AtomicCmpXchg(RawPointer addr, int cmp, int newVal, int size)
		// where T : unmanaged, INumber<T>
	{
		lock (Memory)
		{
			int tmp = Mem.Load<int>(addr);
			bool didXchg = (tmp == cmp);
			if (didXchg)
			{
				Mem.Store<int>(addr, newVal, size);
			}
			return (tmp, didXchg);
		}
	}
	
	[MethodImpl( MethodImplOptions.AggressiveInlining )]
	public static (long, bool) AtomicCmpXchg(RawPointer addr, long cmp, long newVal, int size)
		// where T : unmanaged, INumber<T>
	{
		lock (Memory)
		{
			long tmp = Mem.Load<long>(addr);
			bool didXchg = (tmp == cmp);
			if (didXchg)
			{
				Mem.Store<long>(addr, newVal, size);
			}
			return (tmp, didXchg);
		}
	}
	

	
	[MethodImpl( MethodImplOptions.AggressiveInlining )]
	public static sbyte AtomicXchg(RawPointer addr, sbyte val, int size)
		// where T : unmanaged, INumber<T>
	{
		lock (Memory)
		{
			sbyte tmp = Mem.Load<sbyte>(addr);
			Mem.Store<sbyte>(addr, val, size);
			return tmp;
		}
	}
	
	[MethodImpl( MethodImplOptions.AggressiveInlining )]
	public static short AtomicXchg(RawPointer addr, short val, int size)
		// where T : unmanaged, INumber<T>
	{
		lock (Memory)
		{
			short tmp = Mem.Load<short>(addr);
			Mem.Store<short>(addr, val, size);
			return tmp;
		}
	}
	
	[MethodImpl( MethodImplOptions.AggressiveInlining )]
	public static int AtomicXchg(RawPointer addr, int val, int size)
		// where T : unmanaged, INumber<T>
	{
		lock (Memory)
		{
			int tmp = Mem.Load<int>(addr);
			Mem.Store<int>(addr, val, size);
			return tmp;
		}
	}
	
	[MethodImpl( MethodImplOptions.AggressiveInlining )]
	public static long AtomicXchg(RawPointer addr, long val, int size)
		// where T : unmanaged, INumber<T>
	{
		lock (Memory)
		{
			long tmp = Mem.Load<long>(addr);
			Mem.Store<long>(addr, val, size);
			return tmp;
		}
	}
	

	
	[MethodImpl( MethodImplOptions.AggressiveInlining )]
	public static sbyte AtomicAdd(RawPointer addr, sbyte val, int size)
		// where T : unmanaged, INumber<T>
	{
		lock (Memory)
		{
			sbyte tmp = Mem.Load<sbyte>(addr);
			Mem.Store<sbyte>(addr, (sbyte)(tmp + val), size);
			return tmp;
		}
	}
	
	[MethodImpl( MethodImplOptions.AggressiveInlining )]
	public static short AtomicAdd(RawPointer addr, short val, int size)
		// where T : unmanaged, INumber<T>
	{
		lock (Memory)
		{
			short tmp = Mem.Load<short>(addr);
			Mem.Store<short>(addr, (short)(tmp + val), size);
			return tmp;
		}
	}
	
	[MethodImpl( MethodImplOptions.AggressiveInlining )]
	public static int AtomicAdd(RawPointer addr, int val, int size)
		// where T : unmanaged, INumber<T>
	{
		lock (Memory)
		{
			int tmp = Mem.Load<int>(addr);
			Mem.Store<int>(addr, (int)(tmp + val), size);
			return tmp;
		}
	}
	
	[MethodImpl( MethodImplOptions.AggressiveInlining )]
	public static long AtomicAdd(RawPointer addr, long val, int size)
		// where T : unmanaged, INumber<T>
	{
		lock (Memory)
		{
			long tmp = Mem.Load<long>(addr);
			Mem.Store<long>(addr, (long)(tmp + val), size);
			return tmp;
		}
	}
	

	
	[MethodImpl( MethodImplOptions.AggressiveInlining )]
	public static sbyte AtomicSub(RawPointer addr, sbyte val, int size)
		// where T : unmanaged, INumber<T>
	{
		lock (Memory)
		{
			sbyte tmp = Mem.Load<sbyte>(addr);
			Mem.Store<sbyte>(addr, (sbyte)(tmp - val), size);
			return tmp;
		}
	}
	
	[MethodImpl( MethodImplOptions.AggressiveInlining )]
	public static short AtomicSub(RawPointer addr, short val, int size)
		// where T : unmanaged, INumber<T>
	{
		lock (Memory)
		{
			short tmp = Mem.Load<short>(addr);
			Mem.Store<short>(addr, (short)(tmp - val), size);
			return tmp;
		}
	}
	
	[MethodImpl( MethodImplOptions.AggressiveInlining )]
	public static int AtomicSub(RawPointer addr, int val, int size)
		// where T : unmanaged, INumber<T>
	{
		lock (Memory)
		{
			int tmp = Mem.Load<int>(addr);
			Mem.Store<int>(addr, (int)(tmp - val), size);
			return tmp;
		}
	}
	
	[MethodImpl( MethodImplOptions.AggressiveInlining )]
	public static long AtomicSub(RawPointer addr, long val, int size)
		// where T : unmanaged, INumber<T>
	{
		lock (Memory)
		{
			long tmp = Mem.Load<long>(addr);
			Mem.Store<long>(addr, (long)(tmp - val), size);
			return tmp;
		}
	}
	
}



public static class ModuleFS
{
    
public const int STDIN_FILENO = 0;
public const int STDOUT_FILENO = 1;
public const int STDERR_FILENO = 2;

// musl/arch/generic/bits/fcntl.h
public const int O_CREAT =        0x40;
public const int O_EXCL =         0x80;
public const int O_NOCTTY =      0x100;
public const int O_TRUNC =       0x200;
public const int O_APPEND =      0x400;
public const int O_NONBLOCK =    0x800;
public const int O_DSYNC =      0x1000;
public const int O_SYNC =     0x101000;
public const int O_RSYNC =    0x101000;
public const int O_DIRECTORY = 0x10000;
public const int O_NOFOLLOW =  0x20000;
public const int O_CLOEXEC =   0x80000;

public const int O_ASYNC =      0x2000;
public const int O_DIRECT =     0x4000;
public const int O_LARGEFILE =  0x8000;
public const int O_NOATIME =   0x40000;
public const int O_PATH =     0x200000;
public const int O_TMPFILE =  0x410000;
public const int O_NDELAY = O_NONBLOCK;

public const int F_DUPFD =  0;
public const int F_GETFD =  1;
public const int F_SETFD =  2;
public const int F_GETFL =  3;
public const int F_SETFL =  4;

public const int F_SETOWN = 8;
public const int F_GETOWN = 9;
public const int F_SETSIG = 10;
public const int F_GETSIG = 11;

// #if __LONG_MAX == 0x7fffffffL
public const int F_GETLK = 12;
public const int F_SETLK = 13;
public const int F_SETLKW = 14;
// #else
// #define F_GETLK 5
// #define F_SETLK 6
// #define F_SETLKW 7
// #endif

public const int F_SETOWN_EX = 15;
public const int F_GETOWN_EX = 16;
public const int F_GETOWNER_UIDS = 17;


// musl/icnlude/fcntl.h
public const int O_SEARCH =   O_PATH;
public const int O_EXEC =     O_PATH;
public const int O_TTY_INIT = 0;

public const int O_ACCMODE = (0x3|O_SEARCH);
public const int O_RDONLY =  0x0;
public const int O_WRONLY =  0x1;
public const int O_RDWR =    0x2;

public const int F_OFD_GETLK = 36;
public const int F_OFD_SETLK = 37;
public const int F_OFD_SETLKW = 38;

public const int F_DUPFD_CLOEXEC = 1030;

public const int F_RDLCK = 0;
public const int F_WRLCK = 1;
public const int F_UNLCK = 2;

public const int FD_CLOEXEC = 1;

public const int AT_FDCWD =  (-100);
public const int AT_SYMLINK_NOFOLLOW =  0x100;
public const int AT_REMOVEDIR =  0x200;
public const int AT_SYMLINK_FOLLOW =  0x400;
public const int AT_EACCESS =  0x200;

public const int POSIX_FADV_NORMAL =     0;
public const int POSIX_FADV_RANDOM =     1;
public const int POSIX_FADV_SEQUENTIAL = 2;
public const int POSIX_FADV_WILLNEED =   3;
public const int POSIX_FADV_DONTNEED =   4;
public const int POSIX_FADV_NOREUSE =    5;

// Defs from emscripten code.
public const int __WASI_WHENCE_SET = 0;
public const int __WASI_WHENCE_CUR = 1;
public const int __WASI_WHENCE_END = 2;

public const int SEEK_SET = __WASI_WHENCE_SET;
public const int SEEK_CUR = __WASI_WHENCE_CUR;
public const int SEEK_END = __WASI_WHENCE_END;

public const int S_ISUID = 0x800;
public const int S_ISGID = 0x400;
public const int S_ISVTX = 0x200;
public const int S_IRUSR = 0x100;
public const int S_IWUSR = 0x80;
public const int S_IXUSR = 0x40;
public const int S_IRWXU = 0x1C0;
public const int S_IRGRP = 0x20;
public const int S_IWGRP = 0x10;
public const int S_IXGRP = 0x8;
public const int S_IRWXG = 0x30;
public const int S_IROTH = 0x4;
public const int S_IWOTH = 0x2;
public const int S_IXOTH = 0x1;
public const int S_IRWXO = 0x7;

public const int AT_NO_AUTOMOUNT = 0x800;
public const int AT_EMPTY_PATH = 0x1000;
public const int AT_STATX_SYNC_TYPE = 0x6000;
public const int AT_STATX_SYNC_AS_STAT = 0x0000;
public const int AT_STATX_FORCE_SYNC = 0x2000;
public const int AT_STATX_DONT_SYNC = 0x4000;
public const int AT_RECURSIVE = 0x8000;

// stat.h
public const int S_IRWXUGO =       (S_IRWXU|S_IRWXG|S_IRWXO);
public const int S_IALLUGO =       (S_ISUID|S_ISGID|S_ISVTX|S_IRWXUGO);
public const int S_IRUGO =         (S_IRUSR|S_IRGRP|S_IROTH);
public const int S_IWUGO =         (S_IWUSR|S_IWGRP|S_IWOTH);
public const int S_IXUGO =         (S_IXUSR|S_IXGRP|S_IXOTH);

// errno.h
public const int EPERM =            1;
public const int ENOENT =           2;
public const int ESRCH =            3;
public const int EINTR =            4;
public const int EIO =              5;
public const int ENXIO =            6;
public const int E2BIG =            7;
public const int ENOEXEC =          8;
public const int EBADF =            9;
public const int ECHILD =          10;
public const int EAGAIN =          11;
public const int ENOMEM =          12;
public const int EACCES =          13;
public const int EFAULT =          14;
public const int ENOTBLK =         15;
public const int EBUSY =           16;
public const int EEXIST =          17;
public const int EXDEV =           18;
public const int ENODEV =          19;
public const int ENOTDIR =         20;
public const int EISDIR =          21;
public const int EINVAL =          22;
public const int ENFILE =          23;
public const int EMFILE =          24;
public const int ENOTTY =          25;
public const int ETXTBSY =         26;
public const int EFBIG =           27;
public const int ENOSPC =          28;
public const int ESPIPE =          29;
public const int EROFS =           30;
public const int EMLINK =          31;
public const int EPIPE =           32;
public const int EDOM =            33;
public const int ERANGE =          34;
public const int EDEADLK =         35;
public const int ENAMETOOLONG =    36;
public const int ENOLCK =          37;
public const int ENOSYS =          38;
public const int ENOTEMPTY =       39;
public const int ELOOP =           40;
public const int EWOULDBLOCK =     EAGAIN;
public const int ENOMSG =          42;
public const int EIDRM =           43;
public const int ECHRNG =          44;
public const int EL2NSYNC =        45;
public const int EL3HLT =          46;
public const int EL3RST =          47;
public const int ELNRNG =          48;
public const int EUNATCH =         49;
public const int ENOCSI =          50;
public const int EL2HLT =          51;
public const int EBADE =           52;
public const int EBADR =           53;
public const int EXFULL =          54;
public const int ENOANO =          55;
public const int EBADRQC =         56;
public const int EBADSLT =         57;
public const int EDEADLOCK =       EDEADLK;
public const int EBFONT =          59;
public const int ENOSTR =          60;
public const int ENODATA =         61;
public const int ETIME =           62;
public const int ENOSR =           63;
public const int ENONET =          64;
public const int ENOPKG =          65;
public const int EREMOTE =         66;
public const int ENOLINK =         67;
public const int EADV =            68;
public const int ESRMNT =          69;
public const int ECOMM =           70;
public const int EPROTO =          71;
public const int EMULTIHOP =       72;
public const int EDOTDOT =         73;
public const int EBADMSG =         74;
public const int EOVERFLOW =       75;
public const int ENOTUNIQ =        76;
public const int EBADFD =          77;
public const int EREMCHG =         78;
public const int ELIBACC =         79;
public const int ELIBBAD =         80;
public const int ELIBSCN =         81;
public const int ELIBMAX =         82;
public const int ELIBEXEC =        83;
public const int EILSEQ =          84;
public const int ERESTART =        85;
public const int ESTRPIPE =        86;
public const int EUSERS =          87;
public const int ENOTSOCK =        88;
public const int EDESTADDRREQ =    89;
public const int EMSGSIZE =        90;
public const int EPROTOTYPE =      91;
public const int ENOPROTOOPT =     92;
public const int EPROTONOSUPPORT = 93;
public const int ESOCKTNOSUPPORT = 94;
public const int EOPNOTSUPP =      95;
public const int ENOTSUP =         EOPNOTSUPP;
public const int EPFNOSUPPORT =    96;
public const int EAFNOSUPPORT =    97;
public const int EADDRINUSE =      98;
public const int EADDRNOTAVAIL =   99;
public const int ENETDOWN =        100;
public const int ENETUNREACH =     101;
public const int ENETRESET =       102;
public const int ECONNABORTED =    103;
public const int ECONNRESET =      104;
public const int ENOBUFS =         105;
public const int EISCONN =         106;
public const int ENOTCONN =        107;
public const int ESHUTDOWN =       108;
public const int ETOOMANYREFS =    109;
public const int ETIMEDOUT =       110;
public const int ECONNREFUSED =    111;
public const int EHOSTDOWN =       112;
public const int EHOSTUNREACH =    113;
public const int EALREADY =        114;
public const int EINPROGRESS =     115;
public const int ESTALE =          116;
public const int EUCLEAN =         117;
public const int ENOTNAM =         118;
public const int ENAVAIL =         119;
public const int EISNAM =          120;
public const int EREMOTEIO =       121;
public const int EDQUOT =          122;
public const int ENOMEDIUM =       123;
public const int EMEDIUMTYPE =     124;
public const int ECANCELED =       125;
public const int ENOKEY =          126;
public const int EKEYEXPIRED =     127;
public const int EKEYREVOKED =     128;
public const int EKEYREJECTED =    129;
public const int EOWNERDEAD =      130;
public const int ENOTRECOVERABLE = 131;
public const int ERFKILL =         132;
public const int EHWPOISON =       133;

// mman.h
public const int PROT_NONE      = 0;
public const int PROT_READ      = 1;
public const int PROT_WRITE     = 2;
public const int PROT_EXEC      = 4;
public const int PROT_GROWSDOWN = 0x01000000;
public const int PROT_GROWSUP   = 0x02000000;


    private static InternalFileRecord StdIn;
    private static InternalFileRecord StdOut;
    private static InternalFileRecord StdErr;
    
    // Make room for standard streams.
    private static int RecordBase = 100;

    private static List<InternalFileRecord> Records = new();

    private class InternalFileRecord : IDisposable
    {
        public int FD;
        public string Path;
        public Stream Stream;
        public int Flags;

        public InternalFileRecord() { }

        public InternalFileRecord(int fd, string path, Stream st)
        {
            FD = fd;
            Path = path;
            Stream = st;
        }

        public virtual void Dispose()
        {
            FD = -1;

            Stream?.Dispose();
            Stream = null;
        }
    }

    private class LogStream : Stream
    {
        public bool IsError { get; set; }
        public override bool CanRead => false;
        public override bool CanSeek => false;
        public override bool CanWrite => true;
        public override long Length => 0;
        public override long Position { get; set; }

        private StringBuilder SB = new();

        public LogStream(bool isErr)
        {
            IsError = isErr;
        }


        public override void Flush()
        {
            if (!IsError)
            {
                Log.Info(SB.ToString());
            }
            else
            {
                Log.Warning(SB.ToString());
            }
            SB.Clear();
        }

        public override int Read( byte[] buffer, int offset, int count )
        {
            throw new NotImplementedException();
        }

        public override long Seek( long offset, SeekOrigin origin )
        {
            throw new NotImplementedException();
        }

        public override void SetLength( long value )
        {
            throw new NotImplementedException();
        }

        public override void Write( byte[] buffer, int offset, int count )
        {
            string text = System.Text.Encoding.UTF8.GetString(buffer, offset, count);
            SB.Append(text);
            Position += count;
        }
    }

    static ModuleFS()
    {
        // Init builtin records.
        StdIn = new InternalFileRecord(STDIN_FILENO, "/dev/stdin", null);
        StdOut = new InternalFileRecord(STDOUT_FILENO,"/dev/stdout", new LogStream(false));
        StdErr = new InternalFileRecord(STDERR_FILENO, "/dev/stderr", new LogStream(true));
    }

    private static InternalFileRecord CreateRecord(Stream str, string path, int flags)
    {
        InternalFileRecord rec = new();
        rec.Stream = str;
        rec.Path = path;
        rec.Flags = flags;
        
        // Try to use a null FD slot.
        for (int i = 0; i < Records.Count; i++)
        {
            if (Records[i] == null)
            {
                // Update this slot.
                rec.FD = RecordBase + i;
                Records[i] = rec;
                return rec;
            }
        }

        // No empty records, add a new one.
        rec.FD = RecordBase + Records.Count;
        Records.Add(rec);
        return rec;
    }

    private static void FreeRecord(int fd)
    {
        fd -= RecordBase;
        if (fd < 0 || fd >= Records.Count)
        {
            throw new Exception("Bad file record!");
            return;
        }

        // Don't modify the list, just free the record.
        Records[fd]?.Dispose();
        Records[fd] = null;
    }

    private static InternalFileRecord GetRecord(int fd)
    {
        if (fd == STDIN_FILENO) return StdIn;
        if (fd == STDOUT_FILENO) return StdOut;
        if (fd == STDERR_FILENO) return StdErr;

        fd -= RecordBase;
        if (fd < 0 || fd >= Records.Count)
        {
            throw new Exception("Bad file record!");
            return null;
        }

        return Records[fd];
    }

    public static string GetFDPath(int fd)
    {
        InternalFileRecord rec = GetRecord(fd);
        return rec.Path;
    }

    // https://github.com/emscripten-core/emscripten/blob/38cad97090777d63d328f2a0b20931c2cb9797a8/src/library_syscall.js
    public static string CalcPath(int dirfd, string path, bool allowEmpty = false)
    {
        if (path.StartsWith('/')) {
            return path;
        }

        // relative path
        string dir;
        if (dirfd == AT_FDCWD)
        {
            // dir = FS.cwd();
            dir = "";
        }
        else
        {
            throw new Exception("No directory support yet!");
            // var dirstream = SYSCALLS.getStreamFromFD(dirfd);
            // dir = dirstream.path;
        }

        if (string.IsNullOrEmpty(path)) {
            if (!allowEmpty) {
                throw new Exception("!allowEmpty");
                // throw new FS.ErrnoError({{{ cDefs.ENOENT }}});;
            }
            return dir;
        }

        return Path.Join(dir, path);
    }
    
    private static FileMode GetFileMode(int flags, bool isWritable)
    {
        if ((flags & O_APPEND) != 0)
            return FileMode.Append;

        if ((flags & O_TRUNC) != 0)
            return FileMode.Truncate;

        if ((flags & O_CREAT) != 0)
        {
            if ((flags & O_EXCL) != 0)
                return FileMode.CreateNew;
            
            if (isWritable)
            {
                return FileMode.Create;
            }
            else
            {
                return FileMode.OpenOrCreate;
            }
        }

        // TODO: OpenOrCreate?
        return FileMode.Open;
    }

    // https://github.com/emscripten-core/emscripten/blob/main/src/library_fs.js#L1020
    private static InternalFileRecord Open(string path, int flags, int mode)
    {
        // if ((flags & O_CREAT) != 0) {
        //     mode = (mode & S_IALLUGO) | S_IFREG;
        // } else {
        //     mode = 0;
        // }

        Stream f;
        if ((flags & O_RDWR) != 0 || (flags & O_WRONLY) != 0)
        {
            f = FileSystem.Data.OpenWrite(path, GetFileMode(flags, true));
        }
        else
        {
            f = FileSystem.Data.OpenRead(path, GetFileMode(flags, false));
        }

        if (f != null)
        {
            return CreateRecord(f, path, flags);
        }

        return null;
    }

    public static void Unlink( string path )
    {
        FileSystem.Data.DeleteFile( path );
    }

    public static void RMDir( string path )
    {
        FileSystem.Data.DeleteDirectory( path, false );
    }

    public static int GetFlags(int fd)
    {
        InternalFileRecord rec = GetRecord(fd);
        if (rec == null)
            throw new Exception("No record!");
        
        return rec.Flags;
    }

    public static void SetFlags(int fd, int flags)
    {
        InternalFileRecord rec = GetRecord(fd);
        if (rec == null)
            throw new Exception("No record!");
        
        // TODO: handle these?
        if ((flags & O_APPEND) != (rec.Flags & O_APPEND))
            throw new Exception("Cannot change append mode after creation!");
    
        rec.Flags = flags;
    }

    private static InternalFileRecord DupStream(InternalFileRecord old, int fd)
    {
        InternalFileRecord rec = new();
        rec.Stream = old.Stream;
        rec.Path = old.Path;
        rec.Flags = old.Flags;

        if (fd < 0)
        {
            // Try to use a null FD slot.
            int i;
            for (i = 0; i < Records.Count; i++)
            {
                if (Records[i] == null)
                {
                    rec.FD = RecordBase + i;
                    Records[i] = rec;
                    break;
                }
            }

            if (i == Records.Count)
            {
                // No empty records, add a new one.
                rec.FD = RecordBase + Records.Count;
                Records.Add(rec);
            }
        }
        else
        {
            // If there was an existing record here it should have been closed.
            Assert.True(Records[fd - RecordBase] == null);

            rec.FD = fd;
            Records[fd - RecordBase] = rec;
        }

        return rec;
    }

    public static int Dup3(int fd, int newfd, int flags)
    {
        InternalFileRecord old = GetRecord(fd);
        if (old == null)
            throw new Exception("No record!");

        if (old.Stream == null)
            throw new Exception($"Invalid stream for '{old.Path}'");
        
        if (old.FD == newfd)
            return -EINVAL;
        
        if (newfd < 0 || newfd >= 4096)
            return -EBADF;

        InternalFileRecord existing = GetRecord(newfd);
        if (existing != null)
        {
            Close(newfd);
        }
        
        return DupStream(old, newfd).FD;
    }

    public static int OpenAt(int dirfd, string path, int flags, int mode)
    {
        if (path == "/dev/stdin") {
            return STDIN_FILENO;
        }
        if (path == "/dev/stdout") {
            return STDOUT_FILENO;
        }
        if (path == "/dev/stderr") {
            return STDERR_FILENO;
        }

        path = CalcPath(dirfd, path);

        // Log.Info($"DEBUG: opening '{path}'");
        
        // TODO: this is probably wrong, it prevents us from creating new files.
        if (!FileSystem.Data.FileExists(path))
            return -1;
        
        return Open(path, flags, mode).FD;
    }
    
    public static void Close(int fd)
    {
        Flush(fd);
        FreeRecord(fd);
    }

    public static void Mkdir(string path, int mode)
    {
        FileSystem.Data.CreateDirectory(path);
    }

    public static void Rename(string oldpath, string newpath)
    {
        if (!FileSystem.Data.FileExists(oldpath))
        {
            throw new Exception($"Rename: file '{oldpath}' doesn't exist!");
            return;
        }

        Span<byte> fileData = FileSystem.Data.ReadAllBytes(oldpath);
        using (var f = FileSystem.Data.OpenWrite(newpath))
        {
            f.Write(fileData);
        }

        // Delete the old file.
        FileSystem.Data.DeleteFile(oldpath);
    }

    public static int FAccessAt(int dirfd, string path, int amode, int flags)
    {
        path = CalcPath(dirfd, path);

        if (!FileSystem.Data.FileExists(path))
            return ENOENT;
        
        // Assume we've always got access.
        return 0;
    }

    public static int ReadLinkAt(int dirfd, string path, RawPointer buf, int bufsize)
    {
        // Symlinks unsupported for now.
        return ENOENT;
    }

    private struct timespec { /*time_t*/ long tv_sec; long tv_nsec; }
    
    private struct stat
    {
        public int st_dev;
        public int st_mode;
        public SizeType st_nlink;
        public int st_uid;
        public int st_gid;
        public int st_rdev;
        public long st_size;
        public int st_blksize;
        public int st_blocks;
        public timespec st_atim;
        public timespec st_mtim;
        public timespec st_ctim;
        public long st_ino;
    };

    public static int Stat(string path, RawPointer buf)
    {
        // TODO: I think the error code defines are wrong.
        if (!FileSystem.Data.FileExists(path))
            return -ENOENT;
        
        // Can't do much without file info.
        // https://github.com/emscripten-core/emscripten/blob/main/src/library_memfs.js#L136
        stat data = new stat();

        data.st_dev = 1;
        data.st_ino = 0;

        // Default.
        data.st_blksize = 4096;
        
        Mem.Store<stat>(buf, data, 96);
        return 0;
    }

    public static void Flush(int fd)
    {
        InternalFileRecord rec = GetRecord(fd);
        if (rec == null)
            throw new Exception("No record!");

        if (rec.Stream == null)
            throw new Exception($"Invalid stream for '{rec.Path}'");
        
        rec.Stream.Flush();
    }

    public static long Seek(int fd, long offset, sbyte whence)
    {
        InternalFileRecord rec = GetRecord(fd);
        if (rec == null)
            throw new Exception("No record!");

        SeekOrigin origin;
        if (whence == SEEK_SET) origin = SeekOrigin.Begin;
        else if (whence == SEEK_CUR) origin = SeekOrigin.Current;
        else if (whence == SEEK_END) origin = SeekOrigin.End;
        else throw new Exception("Bad whence!");

        if (rec.Stream == null)
            throw new Exception($"Invalid stream for '{rec.Path}'");
        
        return rec.Stream.Seek(offset, origin);
    }

    public static int Read(int fd, RawPointer ptr, int len)
    {
        InternalFileRecord rec = GetRecord(fd);
        if (rec == null)
            throw new Exception("No record!");
        
        if (rec.Stream == null)
            throw new Exception($"Invalid stream for '{rec.Path}'");
        
        return rec.Stream.Read(Mem.Range(ptr, len));
    }

    public static int Write(int fd, RawPointer ptr, int len)
    {
        InternalFileRecord rec = GetRecord(fd);
        if (rec == null)
            throw new Exception("No record!");
        
        if (rec.Stream == null)
            throw new Exception($"Invalid stream for '{rec.Path}'");
        
        long pos = rec.Stream.Position;
        rec.Stream.Write(Mem.Range(ptr, len));
        return (int)(rec.Stream.Position - pos);
    }

    public static void Map(int fd, RawPointer ptr, int len, long offset)
    {
        InternalFileRecord rec = GetRecord(fd);
        if (rec == null)
            throw new Exception("No record!");
        
        if (rec.Stream == null)
            throw new Exception($"Invalid stream for '{rec.Path}'");
        
        long origPos = rec.Stream.Position;
        rec.Stream.Seek(offset, SeekOrigin.Begin);
        rec.Stream.Read(Mem.Range(ptr, len));
        rec.Stream.Seek(origPos, SeekOrigin.Begin);
    }

    public static void MSync(int fd, RawPointer ptr, int len, long offset)
    {
        InternalFileRecord rec = GetRecord(fd);
        if (rec == null)
            throw new Exception("No record!");
        
        if (rec.Stream == null)
            throw new Exception($"Invalid stream for '{rec.Path}'");
        
        long origPos = rec.Stream.Position;
        rec.Stream.Seek(offset, SeekOrigin.Begin);
        rec.Stream.Write(Mem.Range(ptr, len));
        rec.Stream.Seek(origPos, SeekOrigin.Begin);
    }

    public static int Truncate(int fd, long length)
    {
        InternalFileRecord rec = GetRecord(fd);
        if (rec == null)
            throw new Exception("No record!");
        
        if (rec.Stream == null)
            throw new Exception($"Invalid stream for '{rec.Path}'");
        
        if (length < 0)
            return -EINVAL;
        
        rec.Stream.SetLength(length);
        return 0;
    }
}

// library_strings.cs


RawPointer StringToNewUTF8(string str)
{
    byte[] data = System.Text.Encoding.UTF8.GetBytes(str);
    RawPointer ret = dex_builtin_malloc(data.Length + 1);
    if (ret != 0)
    {
        Mem.Store(ret, data, data.Length);

        // Null terminate.
        Mem.StoreByte(ret+data.Length, 0);
    }

    return ret;
}
// library_exceptions.cs


// Wraps an exception value.
public class ExceptionWrap : Exception
{
	public object Object;

	public ExceptionWrap( object obj )
	{
		Object = obj;
	}
}

// Unreachable exception.
public class Unreachable : Exception
{
}

// Exception handling, similar to:
// https://github.com/emscripten-core/emscripten/blob/main/src/library_exceptions.js

struct ExceptionInfo
{
    public RawPointer ExcPtr;
    public RawPointer Ptr;

    public ExceptionInfo(RawPointer ex)
    {
        ExcPtr = ex;
        // sizeof(__cxa_exception)
        Ptr = ExcPtr - 24;
    }

    
    public void SetType(RawPointer type)
    {
        // C_STRUCTS.__cxa_exception.exceptionType
        Mem.Store(Ptr + 4, type);
    }

    public RawPointer GetType()
    {
        // C_STRUCTS.__cxa_exception.exceptionType
        return Mem.LoadInt(Ptr + 4);
    }

    public void SetDestructor(int destructor)
    {
        // C_STRUCTS.__cxa_exception.destructor
        Mem.Store(Ptr + 8, destructor);
    }

    public RawPointer GetDestructor() {
        // C_STRUCTS.__cxa_exception.destructor
        return Mem.LoadInt(Ptr + 8);
    }

    public void SetCaught(bool caught)
    {
        // C_STRUCTS.__cxa_exception.caught
        sbyte iCaught = (sbyte)(caught ? 1 : 0);
        Mem.Store(Ptr + 12, iCaught);
    }

    public bool GetCaught()
    {
        // C_STRUCTS.__cxa_exception.caught
        return Mem.LoadByte(Ptr + 12) != 0;
    }

    public void SetRethrown(bool rethrown)
    {
        // C_STRUCTS.__cxa_exception.rethrown
        sbyte iRethrown = (sbyte)(rethrown ? 1 : 0);
        Mem.Store(Ptr + 13, iRethrown);
    }

    public bool GetRethrown()
    {
        // C_STRUCTS.__cxa_exception.rethrown
        return Mem.LoadByte(Ptr + 13) != 0;
    }

    // Initialize native structure fields. Should be called once after allocated.
    public void Init(RawPointer type, RawPointer destructor)
    {
        // #if EXCEPTION_DEBUG
        //       dbg('ExceptionInfo init: ' + [type, destructor]);
        // #endif
        this.SetAdjustedPtr(0);
        this.SetType(type);
        this.SetDestructor(destructor);
    }

    public void SetAdjustedPtr(RawPointer adjustedPtr)
    {
        // C_STRUCTS.__cxa_exception.adjustedPtr
        Mem.Store(Ptr + 16, adjustedPtr);
    }

    public RawPointer GetAdjustedPtr()
    {
        // C_STRUCTS.__cxa_exception.adjustedPtr
        return Mem.LoadInt(Ptr + 16);
    }
}

private int UncaughtExceptionCount = 0;
private RawPointer ExceptionLast = 0;
private Stack<ExceptionInfo> ExceptionCaught = new();

void __cxa_throw(RawPointer ptr, RawPointer type, RawPointer destructor)
{
    var info = new ExceptionInfo(ptr);
    // Initialize ExceptionInfo content after it was allocated in __cxa_allocate_exception.
    info.Init(type, destructor);
    ExceptionLast = ptr;
    UncaughtExceptionCount++;
    throw new ExceptionWrap(ExceptionLast);
}

void __cxa_rethrow()
{
    if (!ExceptionCaught.TryPop(out ExceptionInfo info)) {
      throw new Exception("no exception to throw");
    }

    RawPointer ptr = info.ExcPtr;
    if (!info.GetRethrown()) {
      // Only pop if the corresponding push was through rethrow_primary_exception
      ExceptionCaught.Push(info);
      info.SetRethrown(true);
      info.SetCaught(false);
      UncaughtExceptionCount++;
    }
    // #if EXCEPTION_DEBUG
    //     dbg('__cxa_rethrow, popped ' +
    //       [ptrToString(ptr), exceptionLast, 'stack', exceptionCaught]);
    // #endif
    ExceptionLast = ptr;
    throw new ExceptionWrap(ExceptionLast);
}

RawPointer llvm_eh_typeid_for(RawPointer type)
{
    return type;
}


RawPointer __cxa_begin_catch(RawPointer ptr)
{
    ExceptionInfo info = new ExceptionInfo(ptr);
    if (!info.GetCaught()) {
      info.SetCaught(true);
      UncaughtExceptionCount--;
    }
    info.SetRethrown(false);
    ExceptionCaught.Push(info);
    // #if EXCEPTION_DEBUG
    //     dbg('__cxa_begin_catch ' + [ptrToString(ptr), 'stack', exceptionCaught]);
    // #endif
    __cxa_increment_exception_refcount(ptr);
    return __cxa_get_exception_ptr(ptr);
}


void __cxa_end_catch()
{
    // Clear state flag.
    setThrew(0, 0);
// #if ASSERTIONS
//     assert(exceptionCaught.length > 0);
// #endif
    // Call destructor if one is registered then clear it.
    ExceptionInfo info = ExceptionCaught.Pop();

// #if EXCEPTION_DEBUG
//     dbg('__cxa_end_catch popped ' + [info, exceptionLast, 'stack', exceptionCaught]);
// #endif
    __cxa_decrement_exception_refcount(info.ExcPtr);
    ExceptionLast = 0; // XXX in decRef?
}

int __cxa_uncaught_exceptions()
{
    return UncaughtExceptionCount;
}

void __cxa_call_unexpected(RawPointer ex)
{
    throw new Exception("Unexpected exception thrown, this is not properly supported - aborting");
}


RawPointer __cxa_current_primary_exception()
{
    if (ExceptionCaught.Count == 0) {
      return 0;
    }
    ExceptionInfo info = ExceptionCaught.Peek();
    __cxa_increment_exception_refcount(info.ExcPtr);
    return info.ExcPtr;
}

void __cxa_rethrow_primary_exception(RawPointer ptr)
{
    if (ptr == 0) return;
    ExceptionInfo info = new ExceptionInfo(ptr);
    ExceptionCaught.Push(info);
    info.SetRethrown(true);
    __cxa_rethrow();
}


RawPointer FindMatchingCatch(RawPointer[] args)
{
    RawPointer thrown =
// #if EXCEPTION_STACK_TRACES
//       exceptionLast?.excPtr;
// #else
      ExceptionLast;
// #endif
    if (thrown == 0) {
      // just pass through the null ptr
      setTempRet0(0);
      return 0;
    }
    var info = new ExceptionInfo(thrown);
    info.SetAdjustedPtr(thrown);
    RawPointer thrownType = info.GetType();
    if (thrownType == 0) {
      // just pass through the thrown ptr
      setTempRet0(0);
      return thrown;
    }

    // can_catch receives a **, add indirection
    // #if EXCEPTION_DEBUG
    //     dbg("findMatchingCatch on " + ptrToString(thrown));
    // #endif
    // The different catch blocks are denoted by different types.
    // Due to inheritance, those types may not precisely match the
    // type of the thrown object. Find one which matches, and
    // return the type of the catch block which should be called.
    foreach (RawPointer caughtType in args) {
      if (caughtType == 0 || caughtType == thrownType) {
        // Catch all clause matched or exactly the same type is caught
        break;
      }
        // C_STRUCTS.__cxa_exception.adjustedPtr
        var adjusted_ptr_addr = info.Ptr + 16;
      if (__cxa_can_catch(caughtType, thrownType, adjusted_ptr_addr) != 0) {
        // #if EXCEPTION_DEBUG
        //         dbg("  findMatchingCatch found " + [ptrToString(info.get_adjusted_ptr()), caughtType]);
        // #endif
        setTempRet0(caughtType);
        return thrown;
      }
    }
    setTempRet0(thrownType);
    return thrown;
}

// Using variadic arguments for this instead of generating them at runtime.
RawPointer __cxa_find_matching_catch_dex(params RawPointer[] args)
{
    return FindMatchingCatch(args);
}

void __resumeException(RawPointer ptr)
{
// #if EXCEPTION_DEBUG
//     dbg("__resumeException " + [ptrToString(ptr), exceptionLast]);
// #endif
    if (ExceptionLast == 0) {
        ExceptionLast = ptr;
    }
    throw new ExceptionWrap(ExceptionLast);
}

// TempRet support.
private RawPointer __tempRet0 = 0;
RawPointer getTempRet0()
{
    return __tempRet0;
}

void setTempRet0(RawPointer x)
{
    __tempRet0 = x;
}

private void _emscripten_throw_longjmp()
{
    throw new ExceptionWrap(float.PositiveInfinity);
}

// #if WASM_EXCEPTIONS || !DISABLE_EXCEPTION_CATCHING
//   $getExceptionMessageCommon__deps: ['__get_exception_message', 'free', '$stackSave', '$stackRestore', '$stackAlloc'],
//   $getExceptionMessageCommon: (ptr) => {
//     var sp = stackSave();
//     var type_addr_addr = stackAlloc({{{ POINTER_SIZE }}});
//     var message_addr_addr = stackAlloc({{{ POINTER_SIZE }}});
//     ___get_exception_message(ptr, type_addr_addr, message_addr_addr);
//     var type_addr = {{{ makeGetValue('type_addr_addr', 0, '*') }}};
//     var message_addr = {{{ makeGetValue('message_addr_addr', 0, '*') }}};
//     var type = UTF8ToString(type_addr);
//     _free(type_addr);
//     var message;
//     if (message_addr) {
//       message = UTF8ToString(message_addr);
//       _free(message_addr);
//     }
//     stackRestore(sp);
//     return [type, message];
//   },
// #endif
// #if WASM_EXCEPTIONS
//   $getCppExceptionTag: () =>
//     // In static linking, tags are defined within the wasm module and are
//     // exported, whereas in dynamic linking, tags are defined in library.js in
//     // JS code and wasm modules import them.
// #if RELOCATABLE
//     ___cpp_exception // defined in library.js
// #else
//     wasmExports['__cpp_exception']
// #endif
//   ,

// #if EXCEPTION_STACK_TRACES
//   // Throw a WebAssembly.Exception object with the C++ tag with a stack trace
//   // embedded. WebAssembly.Exception is a JS object representing a Wasm
//   // exception, provided by Wasm JS API:
//   // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/WebAssembly/Exception
//   // In release builds, this function is not needed and the native
//   // _Unwind_RaiseException in libunwind is used instead.
//   __throw_exception_with_stack_trace__deps: ['$getCppExceptionTag', '$getExceptionMessage'],
//   __throw_exception_with_stack_trace: (ex) => {
//     var e = new WebAssembly.Exception(getCppExceptionTag(), [ex], {traceStack: true});
//     e.message = getExceptionMessage(e);
//     throw e;
//   },
// #endif

//   // Given an WebAssembly.Exception object, returns the actual user-thrown
//   // C++ object address in the Wasm memory.
//   $getCppExceptionThrownObjectFromWebAssemblyException__deps: ['$getCppExceptionTag', '__thrown_object_from_unwind_exception'],
//   $getCppExceptionThrownObjectFromWebAssemblyException: (ex) => {
//     // In Wasm EH, the value extracted from WebAssembly.Exception is a pointer
//     // to the unwind header. Convert it to the actual thrown value.
//     var unwind_header = ex.getArg(getCppExceptionTag(), 0);
//     return ___thrown_object_from_unwind_exception(unwind_header);
//   },

//   $incrementExceptionRefcount__deps: ['__cxa_increment_exception_refcount', '$getCppExceptionThrownObjectFromWebAssemblyException'],
//   $incrementExceptionRefcount: (ex) => {
//     var ptr = getCppExceptionThrownObjectFromWebAssemblyException(ex);
//     ___cxa_increment_exception_refcount(ptr);
//   },

//   $decrementExceptionRefcount__deps: ['__cxa_decrement_exception_refcount', '$getCppExceptionThrownObjectFromWebAssemblyException'],
//   $decrementExceptionRefcount: (ex) => {
//     var ptr = getCppExceptionThrownObjectFromWebAssemblyException(ex);
//     ___cxa_decrement_exception_refcount(ptr);
//   },

//   $getExceptionMessage__deps: ['$getCppExceptionThrownObjectFromWebAssemblyException', '$getExceptionMessageCommon'],
//   $getExceptionMessage: (ex) => {
//     var ptr = getCppExceptionThrownObjectFromWebAssemblyException(ex);
//     return getExceptionMessageCommon(ptr);
//   },

// #elif !DISABLE_EXCEPTION_CATCHING
//   $incrementExceptionRefcount__deps: ['__cxa_increment_exception_refcount'],
//   $incrementExceptionRefcount: (ptr) => ___cxa_increment_exception_refcount(ptr),

//   $decrementExceptionRefcount__deps: ['__cxa_decrement_exception_refcount'],
//   $decrementExceptionRefcount: (ptr) => ___cxa_decrement_exception_refcount(ptr),

//   $getExceptionMessage__deps: ['$getExceptionMessageCommon'],
//   $getExceptionMessage: (ptr) => getExceptionMessageCommon(ptr),

// #endif


	public const int POINTER_SIZE = 4;
	public const int WASM_PAGE_SIZE = 65536;
	public const string ProgName = "./this.program";
	private RawPointer MainLoopFunction = 0;

	public int FrameCount = 0;

	public static string GetString(RawPointer ptr, int len)
	{
		byte[] data = Mem.Load( ptr, len );
		return System.Text.Encoding.UTF8.GetString( data );
	}

	public static string GetString(RawPointer ptr)
	{
		// if (ptr == 0)
		// 	return "";
		
		int len = 0;
		while(Mem.LoadByte(ptr+len) != 0)
			len++;
		
		byte[] data = Mem.Load( ptr, len );
		return System.Text.Encoding.UTF8.GetString( data );
	}

	public static void WriteString(RawPointer ptr, int len, string str)
	{
		if (len == 0)
			return;
		
		// Write string to buffer.
		byte[] data = System.Text.Encoding.UTF8.GetBytes(str);
		int writeLen = Math.Min(len - 1, data.Length);
		Mem.Store(ptr, data, writeLen);
		ptr += writeLen;

		// Null terminate.
		Mem.StoreByte(ptr, 0);
		ptr += 1;
	}

	public static RawPointer WriteStringUnchecked(RawPointer ptr, string str)
	{
		// Write string to buffer.
		byte[] data = System.Text.Encoding.UTF8.GetBytes(str);
		Mem.Store(ptr, data, data.Length);
		ptr += data.Length;

		// Null terminate.
		Mem.StoreByte(ptr, 0);
		ptr += 1;

		return ptr;
	}

	public static RawPointer TempString(string str, ref int sp)
	{
		byte[] data = System.Text.Encoding.UTF8.GetBytes(str);
		RawPointer ptr = Mem.StackAlloc(data.Length + 1, ref sp);

		Mem.Store(ptr, data, data.Length);

		// Null terminate.
		Mem.StoreByte(ptr+data.Length, 0);

		return ptr;
	}

	protected class StringScope : IDisposable
	{
		public RawPointer Pointer;
		private int sp = 0;

		public StringScope(string str)
		{
			byte[] data = System.Text.Encoding.UTF8.GetBytes(str);
			Pointer = Mem.StackAlloc(data.Length + 1, ref sp);

			Mem.Store(Pointer, data, data.Length);

			// Null terminate.
			Mem.StoreByte(Pointer+data.Length, 0);
		}

		public virtual void Dispose()
		{
			if (sp != 0) Mem.PopStack(sp);
			sp = 0;
		}
	}

	public (IDisposable, RawPointer) ScopedString(string str)
	{
		var scope = new StringScope(str);
		return (scope, scope.Pointer);
	}

	private int llvm_wasm_memory_size_i32__75954c26(int i)
	{
		// Returns # of WASM pages (64KiB), so shift.
		// TODO: does this include the heap?
		return Mem.Size >> 16;
	}

	private int dex_resize_heap(int requested_size)
	{
		// Align to WASM page size.
		requested_size = Mem.AlignPtr(requested_size, 1 << 16);
		return Mem.Resize(requested_size);
	}


	private RawPointer dex_stack_get_base()
	{
		return Mem.StackBase;
	}

	private RawPointer dex_stack_get_end()
	{
		return Mem.StackEnd;
	}

	public void dex_stack_set_limits(RawPointer stackBase, RawPointer stackEnd)
	{
		Mem.SetStackLimits(stackBase, stackEnd);
	}

	private RawPointer dex_stack_get_current()
	{
		return Mem.StackPos;
	}

	private RawPointer dex_stack_get_free()
	{
		return Mem.StackPos - Mem.StackEnd;
	}

	private RawPointer mmapAlloc(RawPointer size)
	{
		size = Mem.AlignPtr(size, WASM_PAGE_SIZE);
		RawPointer ptr = dex_builtin_memalign(WASM_PAGE_SIZE, size);
		if (ptr != 0) Mem.Set(ptr, 0, size);
		
		return ptr;
	}

	private int _mmap_js(int length, int prot, int flags, int fd, long offset, RawPointer allocated, RawPointer addr)
	{
		// This is freed by emscripten code.
		RawPointer ptr = mmapAlloc(length);
		if (ptr == 0)
			throw new Exception("_mmap_js: alloc failed");
		
		ModuleFS.Map(fd, ptr, length, offset);
		Mem.Store(allocated, (int)1);
		Mem.Store(addr, ptr);
		return 0;
	}

	private int _munmap_js(int addr, int length, int prot, int flags, int fd, long offset)
	{
		// Just sync, afaict the free is done for us.
		if ((prot & ModuleFS.PROT_WRITE) != 0) {
			ModuleFS.MSync(fd, addr, length, offset);
		}
		return 0;
	}

	private List<string> Environment = new() {
        "USER=web_user",
        "LOGNAME=web_user",
        "PATH=/",
        "PWD=/",
        "HOME=/home/web_user",
        "LANG=C.UTF-8",
        "_=" + ProgName
	};

	// environment
	private short __wasi_environ_sizes_get(RawPointer argc, RawPointer argv_buf_size)
	{
		Mem.Store<int>(argc, Environment.Count, 4);

		int bufSize = 0;
		// envvars are null terminated.
		foreach (var str in Environment)
			bufSize += System.Text.Encoding.UTF8.GetBytes(str).Length + 1;
		
		Mem.Store<int>(argv_buf_size, bufSize, 4);

		return 0;
	}

	private short __wasi_environ_get(RawPointer environ, RawPointer environ_buf)
	{
		for (int iVar = 0; iVar < Environment.Count; ++iVar)
		{
			Mem.Store<RawPointer>(environ, environ_buf, 4);

			// Write string to buffer.
			environ_buf = WriteStringUnchecked(environ_buf, Environment[iVar]);

			environ += 4;
		}

		return 0;
	}

	private void _emscripten_get_progname(RawPointer buf, int buf_len)
	{
		WriteString(buf, buf_len, ProgName);
	}

	private int _emscripten_system(RawPointer command)
	{
		// Can't call external programs.
		if (command == 0) return 0;

		return -ModuleFS.ENOSYS;
	}

	private int __syscall_getcwd(RawPointer buf, int size)
	{
		string cwd = "/";
		if (cwd.Length + 1 < size)
			return -1;
		
		WriteString(buf, size, cwd);
		return cwd.Length + 1;
	}

	// https://github.com/emscripten-core/emscripten/blob/38cad97090777d63d328f2a0b20931c2cb9797a8/src/library_syscall.js#L746

	private int __syscall_fcntl64(int fd, int cmd, params object[] args)
	{
		// https://linux.die.net/man/2/fcntl64
		switch (cmd)
		{
		case ModuleFS.F_GETFL:
			// Get the file access mode and the file status flags.
			return ModuleFS.GetFlags(fd);
			break;
		case ModuleFS.F_SETFL:
			// On Linux this command can change only the O_APPEND, O_ASYNC, O_DIRECT, O_NOATIME, and O_NONBLOCK flags.
			long flags = unchecked((long)args[0]);
			ModuleFS.SetFlags(fd, unchecked((int)flags));
			break;
		default:
			throw new Exception($"fcntl64: Unsupported command {cmd}!");
			break;
		}

		return 0;
	}

	private int __syscall_ioctl(int fd, int op, params object[] args)
	{
		// https://linux.die.net/man/2/ioctl
		switch (op)
		{
		default:
			throw new Exception($"ioctl: Unsupported op {op}!");
			break;
		}

		return 0;
	}

	private int __syscall_dup3(int fd, int newfd, int flags)
	{
		return ModuleFS.Dup3(fd, newfd, flags);
	}

	private int __syscall_openat(int dirfd, RawPointer pPath, int flags, params object[] args)
	{
		string path = GetString(pPath);

		int mode = 0;
		if (args.Length > 0)
		{
			if (args[0] is long l)
				mode = unchecked((int)l);
			else
				mode = (int)args[0];
		}

		return ModuleFS.OpenAt(dirfd, path, flags, mode);
	}

	private int __syscall_mkdirat(int dirfd, RawPointer pPath, int mode)
	{
		string path = GetString(pPath);
		path = ModuleFS.CalcPath(dirfd, path);

		// remove a trailing slash, if one - /a/b/ has basename of '', but
		// we want to create b in the context of this function
		// path = Path.TrimEndingDirectorySeparator(path);
		// if (path[path.length-1] === '/') path = path.substr(0, path.length-1);

		ModuleFS.Mkdir(path, mode);
		return 0;
	}

	private int __syscall_renameat(int olddirfd, RawPointer pOldpath, int newdirfd, RawPointer pNewpath)
	{
		string oldpath = GetString(pOldpath);
		string newpath = GetString(pNewpath);

		oldpath = ModuleFS.CalcPath(olddirfd, oldpath);
		newpath = ModuleFS.CalcPath(newdirfd, newpath);
		ModuleFS.Rename(oldpath, newpath);
		return 0;
	}

	private int __syscall_faccessat(int dirfd, RawPointer pPath, int amode, int flags)
	{
		string path = GetString(pPath);
		
		return ModuleFS.FAccessAt(dirfd, path, amode, flags);
	}
	
	private int __syscall_readlinkat(int dirfd, RawPointer pPath, RawPointer buf, int bufsize)
	{
		string path = GetString(pPath);

		return ModuleFS.ReadLinkAt(dirfd, path, buf, bufsize);
	}

	private int __syscall_stat64(RawPointer pPath, RawPointer buf)
	{
		string path = GetString(pPath);
		return ModuleFS.Stat(path, buf);
	}

	private int __syscall_lstat64(RawPointer pPath, RawPointer buf)
	{
		// We don't support symlinks so this is the same as stat64.
		string path = GetString(pPath);
		return ModuleFS.Stat(path, buf);
	}

	private int __syscall_fstat64(int fd, RawPointer buf)
	{
		string path = ModuleFS.GetFDPath(fd);
		return ModuleFS.Stat(path, buf);
	}

	private int __syscall_ftruncate64(int fd, long length)
	{
		return ModuleFS.Truncate(fd, length);
	}

	private int __syscall_newfstatat(int dirfd, RawPointer pPath, RawPointer buf, int flags)
	{
		bool allowEmpty = (flags & ModuleFS.AT_EMPTY_PATH) != 0;
		string path = GetString(pPath);
		path = ModuleFS.CalcPath(dirfd, path, allowEmpty);
		return ModuleFS.Stat(path, buf);
	}

	private int __syscall_rmdir(RawPointer pPath)
	{
		string path = GetString(pPath);
		ModuleFS.RMDir( path );
		return 0;
	}

	private int __syscall_unlinkat(int dirfd, RawPointer pPath, int flags)
	{
		string path = GetString(pPath);
		path = ModuleFS.CalcPath(dirfd, path);
		if (flags == 0) {
			ModuleFS.Unlink(path);
		} else if (flags == ModuleFS.AT_REMOVEDIR) {
			ModuleFS.RMDir(path);
		} else {
			throw new Exception("Invalid flags passed to unlinkat");
		}
    	return 0;
	}

	private short __wasi_fd_close(int fd)
	{
		ModuleFS.Close(fd);
		return 0;
	}


	private short __wasi_fd_seek(int fd, long offset, sbyte whence, RawPointer o_newoffset)
	{
		long newPos = ModuleFS.Seek(fd, offset, whence);
		Mem.Store<long>(o_newoffset, newPos, 8);
		return 0;
	}

	struct iovec
	{
		public RawPointer iov_base;
		public uint iov_len;
	}

		
	private short __wasi_fd_read( int fd, RawPointer iovs, int iovs_len, RawPointer nread )
	{
		uint bytesRead = 0;
		for ( int scatter = 0; scatter < iovs_len; scatter++ )
		{
			iovec vc = Mem.Load<iovec>( iovs );
			iovs += 8;

			int n = ModuleFS.Read(fd, vc.iov_base, (int)vc.iov_len);
			if (n < 0)
				return -1;
				
			bytesRead += (uint)n;

			// nothing else to read.
			if (n < (int)vc.iov_len)
				break;
		}

		Mem.Store<uint>( nread, bytesRead, 4 );
		return 0;
	}

	private short __wasi_fd_write( int fd, RawPointer iovs, int iovs_len, RawPointer nwritten )
	{
		uint bytesWritten = 0;
		for ( int gather = 0; gather < iovs_len; gather++ )
		{
			iovec vc = Mem.Load<iovec>( iovs );
			iovs += 8;

			int n = ModuleFS.Write(fd, vc.iov_base, (int)vc.iov_len);
			if (n < 0)
				return -1;
			
			bytesWritten += (uint)n;

			// nothing else to write.
			if (n < (int)vc.iov_len)
				break;
		}

		// Flush when all gathers are done.
		ModuleFS.Flush(fd);

		Mem.Store<uint>( nwritten, bytesWritten, 4 );
		return 0;
	}

	private void _emscripten_memcpy_js( RawPointer dst, RawPointer src, int n )
	{
		Mem.Copy( dst, src, n );
	}

	// Time.
	private bool _dex_get_now_is_monotonic()
	{
		return true;
	}

	private double dex_date_now()
	{
		// Date.now() equivalent (rounded to ms)
		return DateTimeOffset.Now.ToUnixTimeMilliseconds();
	}

	private double dex_get_now()
	{
		// Performance.now() equivalent (not rounded, goes to the microsecond)
		return RealTime.GlobalNow;
	}

	struct tm {
		public int tm_sec;
		public int tm_min;
		public int tm_hour;
		public int tm_mday;
		public int tm_mon;
		public int tm_year;
		public int tm_wday;
		public int tm_yday;
		public int tm_isdst;
		public long __tm_gmtoff;
		public RawPointer __tm_zone;
	};

	private void _localtime_js(long t, RawPointer o_tm)
	{
		var localTime = DateTime.UnixEpoch.AddSeconds(t);
		localTime = localTime.ToLocalTime();

		tm data = new tm();

		data.tm_sec = localTime.Second;
		data.tm_min = localTime.Minute;
		data.tm_hour = localTime.Hour;
		data.tm_mday = localTime.Day;
		data.tm_mon = localTime.Month;
		data.tm_year = localTime.Year-1900;
		data.tm_wday = (int)localTime.DayOfWeek;
		data.tm_yday = localTime.DayOfYear;
		data.tm_isdst = localTime.IsDaylightSavingTime() ? 1 : 0;
		data.__tm_gmtoff = TimeZoneInfo.Local.GetUtcOffset(localTime).Seconds;
		data.__tm_zone = 0;

		Mem.Store<tm>(o_tm, data, 48);
	}

	private long _mktime_js( RawPointer tm )
	{
		tm data = Mem.Load<tm>( tm );

		DateTime time = new DateTime( data.tm_year+1900, data.tm_mon, data.tm_mday, data.tm_hour, data.tm_min, data.tm_sec, DateTimeKind.Local );
		
		// Convert to UTC.
		time = time.ToUniversalTime();

		data.tm_sec = time.Second;
		data.tm_min = time.Minute;
		data.tm_hour = time.Hour;
		data.tm_mday = time.Day;
		data.tm_mon = time.Month;
		data.tm_year = time.Year-1900;
		data.tm_wday = (int)time.DayOfWeek;
		data.tm_yday = time.DayOfYear;
		// No DST in UTC.
		// data.tm_isdst = time.IsDaylightSavingTime() ? 1 : 0;

		Mem.Store<tm>(tm, data, 48);

		return (long)time.Subtract(DateTime.UnixEpoch).TotalSeconds;
	}

	private void _gmtime_js( long t, RawPointer o_tm )
	{
		// UTC time.
		var time = DateTime.UnixEpoch.AddSeconds(t);

		tm data = new tm();

		data.tm_sec = time.Second;
		data.tm_min = time.Minute;
		data.tm_hour = time.Hour;
		data.tm_mday = time.Day;
		data.tm_mon = time.Month;
		data.tm_year = time.Year-1900;
		data.tm_wday = (int)time.DayOfWeek;
		data.tm_yday = time.DayOfYear;
		data.tm_isdst = time.IsDaylightSavingTime() ? 1 : 0;
		// data.__tm_gmtoff = TimeZoneInfo.Local.GetUtcOffset(time).Seconds;
		// data.__tm_zone = 0;

		Mem.Store<tm>(o_tm, data, 48);
	}

	private void _tzset_js(RawPointer timezone, RawPointer daylight, RawPointer std_name, RawPointer dst_name)
	{
		TimeZoneInfo tzinfo = TimeZoneInfo.Local;

		Mem.Store<SizeType>(timezone, (SizeType)tzinfo.BaseUtcOffset.TotalSeconds, 4);
		Mem.Store<int>(daylight, tzinfo.SupportsDaylightSavingTime ? 1 : 0, 4);
		
		WriteStringUnchecked(std_name, tzinfo.StandardName);
		WriteStringUnchecked(dst_name, tzinfo.DaylightName);
	}

	// Sockets.
	private int __syscall_socket(int domain, int type, int protocol, int dummy1, int dummy2, int dummy3)
	{
		return -1;
	}

	private int __syscall_getsockname(int sockfd, RawPointer addr, RawPointer len, int dummy, int dummy2, int dummy3)
	{
		WriteString(addr, len, "0.0.0.0");
		return 0;
	}

	private int __syscall_bind(int sockfd, RawPointer addr, int alen, int dummy, int dummy2, int dummy3)
	{
		return 0;
	}

	private int __syscall_recvfrom(int sockfd, RawPointer msg, int len, int flags, RawPointer addr, RawPointer alen)
	{
		throw new Exception("recvfrom not supported!");
	}

	private int __syscall_sendto(int sockfd, RawPointer msg, int len, int flags, RawPointer addr, RawPointer alen)
	{
		throw new Exception("sendto not supported!");
	}

	private void exit(int status)
	{
		throw new Exception("Exit!");
	}

	private void _abort_js()
	{
		throw new Exception("Abort!");
	}

	private void __wasi_proc_exit(int code)
	{
		throw new Exception($"Exit code {code}");
	}

	private void __call_sighandler(RawPointer handler, int code)
	{
		if (code == 5)
		{
			if (Game.IsEditor)
				throw new Exception("debug break");
			return;
		}

		throw new Exception($"Unknown sighandler {code} ({handler})");
	}
	
	private int sem_timedwait(RawPointer sem, RawPointer at)
	{
		// This is causing compile errors but for some reason it isn't in the Emscripten system libs.
		// Just stubbed out to clean things up.
		throw new Exception("sem_timedwait");
	}

	// Assert.
	private void __assert_fail(RawPointer pExpr, RawPointer pFile, int line, RawPointer pFunc)
	{
		Log.Error($"Assertion failed: {GetString(pExpr)}, at: {(pFile != 0 ? GetString(pFile) : "unknown file")}, line {line}, {(pFunc != 0 ? GetString(pFunc) : "unknown function")}");
	}

	private int _emscripten_lookup_name(RawPointer pName)
	{
		string name = GetString(pName);

		throw new Exception("hostname lookup unsupported!");
		return 0;
	}

	// Platform.
	private void dex_set_main_loop(RawPointer fn, int fps, bool infinite)
	{
		MainLoopFunction = fn;
	}

	public bool MainLoopInRenderThread = false;
	private static Action BeginFrameGL = null;

	public void DoMainLoop()
	{
		if (MainLoopInRenderThread)
			return;
		
		if (BeginFrameGL != null)
			BeginFrameGL();
			
		if (MainLoopFunction != 0)
		{
			// ++FrameCount;
			// Log.Info($"Do frame: {FrameCount}");
			Mem.CallFuncPtr(MainLoopFunction);
		}
	}
}

} // Dextr

