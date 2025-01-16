using LuaBox;


public sealed class MyComponent : Component
{
	[Property] public string StringProperty { get; set; }

	protected override void OnEnabled()
	{
		base.OnEnabled();

		//SceneModel model = new SceneModel( Game.ActiveScene );

		LuaTest();
	}

	protected override void OnUpdate()
	{
	}

	private void LuaTest()
	{
		Lua.Init();

		var lua = Lua.CreateContext();

		if ( !lua.LoadFile( "script.lua" ) )
			return;

		/*
		lua.NewTable();
		for ( int i = 1; i <= 5; i++ )
		{
			lua.PushNumber( i );
			lua.PushNumber( i * 2 );
			lua.RawSet( -3 );
		}

		lua.SetGlobal( "foo" );
		*/

		int result = lua.PCall( 0, Lua.MultRet, 0 );
		if (result != 0)
		{
			Log.Error($"Failed to run script: {lua.ToString( -1 )}");
			return;
		}

		double sum = lua.ToNumber( -1 );
		Log.Info( $"Script returned: {sum}" );
		lua.Pop( 1 );

		lua?.Dispose();
	}
}
