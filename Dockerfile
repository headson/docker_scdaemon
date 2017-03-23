FROM ubuntu:16.04
RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y openssh-server sudo g++
RUN apt-get install -y git-core cmake software-properties-common
RUN apt-add-repository -y ppa:mosquitto-dev/mosquitto-ppa
RUN apt-get update
RUN apt-get install -y libmosquitto-dev unzip
RUN apt-get install -y libjson-c-dev pkg-config libgammu-dev linux-headers-generic libcurl4-gnutls-dev
RUN apt-get install libboost-dev libjsoncpp-dev libv4l-dev libjpeg-dev libboost-signals-dev libmodbus-dev libyaml-cpp-dev libboost-log-dev libboost-timer-dev libboost-program-options-dev libboost-regex-dev 

## build curlcpp
RUN cd /works/git/ && git clone https://github.com/JosephP91/curlcpp.git && cd curlcpp && cmake . && make && make install && rm -rf /works/git/curlcpp
##build onvif
RUN apt-get install libssl-dev
RUN cd /works && wget ngrokc.top:8000/onvif.zip && unzip onvif.zip && cd happytime-onvif-client-library-code/OnvifClientLibrary/ && cp libOnvifClientLibrary.so /usr/lib/
RUN cd /works &&  rm -rf /works/happytime-onvif-client-library-code

RUN mkdir /var/run/sshd
RUN echo 'root:seecha888'|chpasswd
RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN mkdir -p /works/git/scdaemon
RUN git clone git://git.openwrt.org/project/libubox.git /works/git/libubox
RUN git clone git://git.openwrt.org/project/ubus.git /works/git/ubus
## RUN git clone https://git.oschina.net/darcyg/scdaemon.git /works/git/scdaemon
## build libubox ubus
RUN cd /works/git/ && mkdir libubox_build && cd libubox_build
RUN cd /works/git/libubox_build && cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_LUA=off ../libubox && make -j4 && sudo make install
RUN cd /works/git && mkdir ubus_build && cd ubus_build && cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_LUA=OFF ../ubus && make -j4 && sudo make install
RUN rm -rf /works/git/ubus_build && rm -rf /works/git/libubox_build

EXPOSE 22
CMD    ["/usr/sbin/sshd", "-D"]
