<<comment
This is script is tested in WLS of window 11 in ubantu 22.04 release , 
Please read README in github to exactly know what to do 
If it break down try to follow one step at a time , and for failed section refer the original help document(in tool original site/git page)
Also search for online help 

#######################################################
#STEP:1(Important) Download maximum of pre-requiste for all tool
########################################################

sudo apt-get update
mkdir -p whyRD_eda_bundle
cd whyRD_eda_bundle
#pre-requisite
echo "installing pre-requisite"
echo "___________________________________________________"
sudo apt-get install build-essential clang bison flex \
	libreadline-dev gawk tcl-dev libffi-dev git \
	graphviz xdot pkg-config python3 libboost-system-dev \
	libboost-python-dev libboost-filesystem-dev zlib1g-dev \
	make m4 tcsh csh libx11-dev gperf  tcl8.6-dev tk8.6 tk8.6-dev \
	libxmp4 libxpm-dev  libxcb1 libcairo2  \
      libxrender-dev libx11-xcb-dev libxaw7-dev freeglut3-dev automake yosys

#######################################################
#STEP:2 Installing xschem
########################################################
cd ~/whyRD_eda_bundle/
#install xschem a schemaic capture tool
git clone https://github.com/StefanSchippers/xschem.git xschem
cd xschem
./configure 
make 
sudo make install 
cd ..

#######################################################
#STEP:3 Installing magic VLSI
########################################################
cd ~/whyRD_eda_bundle/
#install magic VLSI layout tool 
git clone git://opencircuitdesign.com/magic
cd magic 
./configure
make 
sudo make install 
cd ..

#######################################################
#STEP:4 Installing ngspice
########################################################
# clone the source repository into a local ngspice_git directory
cd ~/whyRD_eda_bundle/
git clone https://git.code.sf.net/p/ngspice/ngspice ngspice_git
cd ngspice_git
mkdir release
## in order to run the following you must have adms installed (sudo apt-get install adms)
sudo apt-get install adms
./autogen.sh --adms
cd release
## by default if no --prefix is provided ngspice will install under /usr/local/{bin,share,man,lib}
## you can add a --prefix=/home/username to install into your home directory.
../configure --with-x --enable-xspice --disable-debug --enable-cider --with-readline=yes --enable-openmp --enable-adms
## build the program
make
## install the program and needed files.
make install
cd ..


#######################################################
#STEP:5 Installing openPDK and sky130nm
########################################################
## fetch the repository with git:
cd ~/whyRD_eda_bundle/
git clone git://opencircuitdesign.com/open_pdks
cd open_pdks
## configure the build, a --prefix option can be given to install
## in a different place, by default after installation a 
## /usr/local/share/pdk directory is created if no --prefix is provided.
## Below line for example requests installation in my home directory
## (/home/schippes/share/pdk):
## ./configure --enable-sky130-pdk --prefix=/home/schippes
## Do the following steps one at a time and ensure no errors are
##  reported after each step.
./configure --enable-sky130-pdk 
make
make install 
cd ..


#integrate sky130 to magic 
sudo ln -s /usr/local/share/pdk/sky130A/libs.tech/magic/* /usr/local/lib/magic/sys
#magic -T sky130A





