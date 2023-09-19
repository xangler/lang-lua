build:
	@echo "just support lua 5.3"
	@gcc -c -I ${HOME}/.luaver/src/lua-5.3.5/src/ -o module/luac_simple.o module/luac_simple.c
	@gcc -bundle -undefined dynamic_lookup -o module/luac_simple.so module/luac_simple.o

	@gcc -c -I ${HOME}/.luaver/src/lua-5.3.5/src/ -o module/luac_compose.o module/luac_compose.c
	@gcc -bundle -undefined dynamic_lookup -o module/luac_compose.so module/luac_compose.o

	@gcc -c -I ${HOME}/.luaver/src/lua-5.3.5/src/ -o cmd/main.o cmd/main.c
	@gcc -L ${HOME}/.luaver/src/lua-5.3.5/src/ -llua -o main.out cmd/main.o
	@echo "just support lua 5.3"

clua:
	main.out

luac:
	LUA_CPATH="$(PWD)/module/?.so;$(LUA_CPATH)" LUA_PATH="$(LUA_PATH)" lua script/luac.lua

.PHONY:
	build clua luac
