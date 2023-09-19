#include <stdio.h>
#include "lua.h"
#include "lauxlib.h"

static int l_count(lua_State *L){
    int val = lua_tointeger(L, lua_upvalueindex(1));
    lua_pushinteger(L, ++val);
    lua_copy(L, -1, lua_upvalueindex(1));
    return 1;
}

static int l_print(lua_State *L){
    printf("hello demo\n");
    if(!lua_isnumber(L, 1)){
        lua_pushliteral(L, "error");
        lua_error(L);
    }
    lua_Number x = lua_tonumber(L, 1);
    lua_pushnumber(L, x*x);
    return 1;
}

int luaopen_luac_simple(lua_State *L){
    lua_pushinteger(L, 0);
    lua_pushcclosure(L, &l_count, 1);
    lua_setglobal(L, "xcount");
    lua_pushcfunction(L, &l_print);
    lua_setglobal(L, "xprint");
    return 0;
}