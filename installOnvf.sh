cd /works 
[ ! -f /works/onvif.zip ] && {
 wget ngrokc.top:8000/onvif.zip 
}
unzip onvif.zip && cd /works/happytime-onvif-client-library-code/OnvifClientLibrary/ && make && cp libOnvifClientLibrary.so /usr/lib/
cd /works &&  rm -rf /works/happytime-onvif-client-library-code