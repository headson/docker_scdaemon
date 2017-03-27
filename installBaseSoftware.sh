sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
apt-get update
apt-get upgrade -y
apt-get install -y openssh-server sudo g++
apt-get install -y git-core cmake software-properties-common
apt-add-repository -y ppa:mosquitto-dev/mosquitto-ppa
apt-get update
apt-get install -y libmosquitto-dev unzip
apt-get install -y libjson-c-dev pkg-config libgammu-dev linux-headers-generic libcurl4-gnutls-dev
apt-get install -y libboost-dev libjsoncpp-dev libv4l-dev libjpeg-dev libboost-signals-dev libmodbus-dev libyaml-cpp-dev libboost-log-dev libboost-timer-dev libboost-program-options-dev libboost-regex-dev 
apt-get install -y libssl-dev
