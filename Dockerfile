FROM ubuntu:16.04

## build curlcpp
RUN mkdir -p /works/git
COPY installBaseSoftware.sh /works
COPY installOnvf.sh /works
COPY sshd.sh /works
COPY instalOpenwrt.sh /works
RUN sh /works/installBaseSoftware.sh
RUN sh /works/installOnvf.sh
RUN sh /works/sshd.sh
RUN sh /works/instalOpenwrt.sh
RUN cd /works/git/ && git clone https://github.com/JosephP91/curlcpp.git && cd curlcpp && cmake . && make && make install && rm -rf /works/git/curlcpp
##build onvif
EXPOSE 22
CMD    ["/usr/sbin/sshd", "-D"]
