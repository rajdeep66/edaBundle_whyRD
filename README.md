# edaBundle_whyRD <br/>
opensource EDA tool flor VLSI design :this script is in its initial phase and usefull if you just starting your journey to open source EDA tool , all ./configure command use default configuration and instrtucted to configure as per your requirement afer you get expertise to any specific tool till then please follow these steps to install yosys,xschem,ngspice,magic,netgen,openPDK and sky130nmpdk
Note: we are assuming you have the linux environment up <br/>
<br/>
<br/>
Step 1: dowload eda_bundle.sh to your machine , and copy file text content top a anyname.sh file in you linux file system.<br/>
Step 2: run it as sh ./anyname.sh -->for most case it will run for few hour will ask you occasionally password and finist the process.<br/>
        But recomended to run it step wise(steps are mensioned in the code itself , and download only the tool you need.<br/>
Step 3: To run Xschem with sky130nm PDK do following thing cd to /usr/local/share/pdk/sky130A/libs.tech/xschem folder and type xschem press enter done , or alternatively copy xschemrc file from /usr/local/share/pdk/sky130A/libs.tech/xschem to any of your desire folder and run xschem.<br/>
step 4: to run magic with sky13nm pdk type "magic -T sky130A" press enter from any location <br/>
step 5: run ngspice,yosys,netgen with simply typeing there name and enter <br/>
step 6: detail tutorial are available in tool's official site.<br/>
