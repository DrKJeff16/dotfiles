! _cmd 'luarocks' && return

export LUA_PATH='/usr/share/lua/5.1/?.lua;/usr/local/share/lua/5.1/?.lua;/usr/local/share/lua/5.1/?/init.lua;/usr/share/lua/5.1/?/init.lua;/usr/local/lib/lua/5.1/?.lua;/usr/local/lib/lua/5.1/?/init.lua;/usr/lib/lua/5.1/?.lua;/usr/lib/lua/5.1/?/init.lua;./?.lua;./?/init.lua;/home/drjeff16/.luarocks/share/lua/5.1/?.lua;/home/drjeff16/.luarocks/share/lua/5.1/?/init.lua'
export LUA_CPATH='/usr/local/lib/lua/5.1/?.so;/usr/lib/lua/5.1/?.so;/usr/local/lib/lua/5.1/loadall.so;/usr/lib/lua/5.1/loadall.so;./?.so;/home/drjeff16/.luarocks/lib/lua/5.1/?.so'

__append2path "$HOME/.luarocks/bin"
