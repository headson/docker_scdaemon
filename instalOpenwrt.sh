git clone git://git.openwrt.org/project/libubox.git /works/git/libubox
git clone git://git.openwrt.org/project/ubus.git /works/git/ubus
## RUN git clone https://git.oschina.net/darcyg/scdaemon.git /works/git/scdaemon
## build libubox ubus
cd /works/git/ && mkdir libubox_build && cd libubox_build
cd /works/git/libubox_build && cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_LUA=off ../libubox && make -j4 && sudo make install
cd /works/git && mkdir ubus_build && cd ubus_build && cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_LUA=OFF ../ubus && make -j4 && sudo make install
rm -rf /works/git/ubus_build && rm -rf /works/git/libubox_build