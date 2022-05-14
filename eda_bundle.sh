<<comment
This is script is tested in WLS of window 11 in ubantu 18.04 release , 
Please read README in github to exactly know what to do 
If it break down try to follwo one step at a time , and for failed section refer the original help document(in tool original site/git page)
for that section 
comment

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
      libxrender-dev libx11-xcb-dev libxaw7-dev freeglut3-dev automake


echo "pre-requisite installed"
echo "_________________________________________________"

#######################################################
#STEP:2(OPTIONAL) Install yosys if you wanna wortk on verilog
########################################################
cd ~/whyRD_eda_bundle/
echo "Installing yosys"
echo "_________________________________________________"
#install yosys it will also download and install ABC 
git clone https://github.com/YosysHQ/yosys.git
cd yosys
./configure 
make
sudo make install
cd ..
#installing iverilog as a dependancy for yosys 
git clone https://github.com/steveicarus/iverilog.git
cd iverilog
sh autoconf.sh
./configure
make 
sudo make install 
cd ~/whyRD_eda_bundle/
#make test
echo "Yosys installed"
echo "_________________________________________________"


#######################################################
#STEP:3 Installing openPDK and sky130nm
########################################################
#install sky130 pdk 
cd ~/whyRD_eda_bundle/
git clone https://github.com/google/skywater-pdk
cd skywater-pdk
git submodule init libraries/sky130_fd_io/latest
git submodule init libraries/sky130_fd_pr/latest
git submodule init libraries/sky130_fd_sc_hd/latest
git submodule init libraries/sky130_fd_sc_hvl/latest
git submodule update
make timing
cd ..

#install open_pdk , which help in installing sky130 tech file to our eda tool
git clone git://opencircuitdesign.com/open_pdks
cd open_pdks
./configure --enable-sky130-pdk=~/whyRD_eda_bundle/skywater-pdk/libraries/ \
            --with-sky130-link-targets=source --with-ef-style 
make 
sudo make install 
make distclean
cd ..



#######################################################
#STEP:4 Installing magic VLSI
########################################################
cd ~/whyRD_eda_bundle/
#install magic VLSI layout tool 
git clone git://opencircuitdesign.com/magic
cd magic 
./configure
make 
sudo make install 
cd ..
#integrate sky130 to magic 
sudo ln -s /usr/local/share/pdk/sky130A/libs.tech/magic/* /usr/local/lib/magic/sys
#magic -T sky130A

#######################################################
#STEP:5 Installing xschem
########################################################
cd ~/whyRD_eda_bundle/
#intsll xshem a schemaic capture 
git clone https://github.com/StefanSchippers/xschem.git xschem
cd xschem
./configure 
make 
sudo make install 
cd ..

#######################################################
#STEP:6 Installing xschem
########################################################
#install ngspice 
cd ~/whyRD_eda_bundle/
sudo apt-get install -y libtool
git clone https://git.code.sf.net/p/ngspice/ngspice ngspice_test
cd ngspice_test
git pull
git checkout pre-master
./autogen.sh
./configure --with-x --enable-xspice --disable-debug --enable-cider \
	--with-readline=yes --enable-openmp 
make
sudo make install
cd ..

#######################################################
#STEP:7 Installing netgen
########################################################
cd ~/whyRD_eda_bundle/
git clone git://opencircuitdesign.com/netgen
cd netgen 
./configure
make
sudo make install

cd ..
