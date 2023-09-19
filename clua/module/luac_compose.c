#include <stdio.h>
#include "lua.h"
#include "lauxlib.h"

static int l_test (lua_State *L){
    printf("hello world\n");
    return 0;
}

static int l_avg(lua_State *L){
    int n = lua_gettop(L);
    lua_Number sum = 0.0;
    int i;
    for (i = 1; i <= n; i++){
        if (!lua_isnumber(L, i)){
            lua_pushliteral(L, "incorect bunber");
            lua_error(L);
        }
        sum += lua_tonumber(L, i);
    }
    lua_pushnumber(L, sum);
    lua_pushnumber(L, sum/n);
    return 2;
}

static int l_map(lua_State *L){
    luaL_checktype(L, 1, LUA_TTABLE);
    luaL_checktype(L, 2, LUA_TFUNCTION);
    int len = luaL_len(L, 1);
    lua_createtable(L, len, 0);
    for (int i = 1; i <= len; i++){
        lua_pushvalue(L, 2);
        lua_geti(L, 1, i);
        lua_call(L, 1, 1);
        lua_seti(L,3, i);
    }
    return 1;
}

static const struct luaL_Reg mylib [] ={
    {"test", l_test},
    {"avg", l_avg},
    {"map", l_map},
    {NULL, NULL}
};

int luaopen_luac_compose(lua_State *L){
    luaL_newlib(L, mylib);
    return 1;
}
