#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "../lua/lua.h"

struct LuaVM_t {
    lua_State* L;
};

typedef struct LuaVM_t LuaVM_t;

LuaVM_t* Lua_InitVM()
{
    int status, result;
    lua_State* L = luaL_newstate();  /* create state */
    if (L == NULL) {
        printf("cannot create state: not enough memory\n");
        return NULL;
    }
    lua_gc(L, LUA_GCSTOP);  /* stop GC while building state */
    lua_pushcfunction(L, &pmain);  /* to call 'pmain' in protected mode */
    lua_pushinteger(L, argc);  /* 1st argument */
    lua_pushlightuserdata(L, argv); /* 2nd argument */
    status = lua_pcall(L, 2, 1, 0);  /* do the call */
    result = lua_toboolean(L, -1);  /* get result */
    report(L, status);
    lua_close(L);
    LuaVM_t* vm = malloc(sizeof(LuaVM_t));
    vm->L = L;

    return vm;
}


void Lua_KillVM(LuaVM_t* vm)
{

}
