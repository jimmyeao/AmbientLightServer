##################################################
# Ambilight Install Script for Raspberry Pi 2/3  #
##################################################
clear
echo "This script takes some time, it requires a raspberrypi 2 or 3 with at least an 8Gb SD Card"
echo "This will also remove Libre Office and Wolfram - are you happy to proceed (Y/N)?"
read perms
if perms = "N"; then
    exit 0
else
clear
echo "Groovy, lets do this.. Removing unneeded software first so we have some space.."
sudo apt-get -y purge wolfram-engine
sudo apt-get -y purge libreoffice
sudo apt-get -y autoremove

sudo apt-get update && sudo apt-get -y upgrade
echo
echo "Ok, now lets install the required packages.."
echo
sudo apt-get -y install build-essential
sudo apt-get -y install sysvinit-core
sudo apt-get -y install libboost-dev
sudo apt-get -y install cmake gfortran git libatlas-base-dev libavcodec-dev libavformat-dev cmake
sudo apt-get -y install libdc1394-22-dev libgtk2.0-dev libjasper-dev libjpeg-dev libpng12-dev libpng-dev
sudo apt-get -y install libswscale-dev libtbb2 libtbb-dev libtiff5-dev libtiff-dev 
sudo apt-get -y install libv4l-dev libx264-dev libxvidcore-dev pkg-config python-dev python-numpy
echo
echo "Time for compiling stuff. This WILL take a long time (3 hours 10 mins on a Raspberry Pi 3)"
echo
cd ~
wget https://github.com/opencv/opencv/archive/2.4.7.tar.gz
tar -zxvf 2.4.7.tar.gz
rm 2.4.7.tar.gz
cd opencv-2.4.7
mkdir build
cd build
sed -i.bak 's/dumpversion/dumpfullversion/' ../cmake/OpenCVDetectCXXCompiler.cmake
cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local -D ENABLE_PRECOMPILED_HEADERS=OFF ..
make -j4
sudo make install

#wget https://github.com/opencv/opencv/archive/master.zip
#unzip master.zip
#rm master.zip
#cd opencv-master
#mkdir build
#cd build
#cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local -D ENABLE_PRECOMPILED_HEADERS=OFF ..
#make -j4
#sudo make install
cd ~
wget http://www.digip.org/jansson/releases/jansson-2.10.tar.gz
tar -zxvf jansson-2.10.tar.gz
rm jansson-2.10.tar.gz
cd jansson-2.10
./configure
make -j4
sudo make check
sudo make install
cd ~
wget https://sourceforge.net/projects/log4cplus/files/log4cplus-stable/1.1.3/log4cplus-1.1.3-rc8.tar.gz
tar -zxvf log4cplus-1.1.3-rc8.tar.gz
rm log4cplus-1.1.3-rc8.tar.gz
cd log4cplus-1.1.3-rc8
./configure
make -j4
sudo make install
cd ~
#wget https://dl.bintray.com/boostorg/release/1.65.1/source/boost_1_65_1.tar.gz
#tar -zxvf boost_1_65_1.tar.gz
#rm boost_1_65_1.tar.gz
#cd boost_1_65_1/
#./bootstrap.sh
#sudo ./b2 install
#go get coffee, go for a walk, maybe a nap, this will take some time..
sudo apt-get install -y wiringpi
sudo apt-get install -y libxml2-dev
cd ~
wget https://sourceforge.net/projects/libwebcam/files/source/libwebcam-src-0.2.5.tar.gz
tar -zxvf libwebcam-src-0.2.5.tar.gz
rm libwebcam-src-0.2.5.tar.gz
cd libwebcam-0.2.5/
mkdir build
cd build
cmake ..
make -j4
sudo make install
cd ~
git clone https://github.com/waldobronchart/AmbientLightServer
cd AmbientLightServer/
mkdir build
make -j4
echo
echo All done here, type sh run.sh to run the server.
echo "you will also want to download the client to set the prefs https://github.com/waldobronchart/AmbientLightPyClient" 
fi
