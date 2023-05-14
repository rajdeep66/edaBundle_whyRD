# edaBundle_whyRD <br/>
opensource EDA tool flor VLSI design :this script is in its initial phase and usefull if you just starting your journey to open source EDA tool , all ./configure command use default configuration and instrtucted to configure as per your requirement afer you get expertise to any specific tool till then please follow these steps to install yosys,xschem,ngspice,magic,netgen,openPDK and sky130nmpdk
Note: we are assuming you have the linux environment up <br/>
<br/>
<br/>
Step 1:copy whyrd_eda_bundle.sh and install_openPDK.sh in your area
Step 2: run source whyrd_eda_bundle.sh -->for most case it will run for few hour will ask you occasionally password and finist the process.<br/>
        But recomended to run it step wise(steps are mensioned in the code itself , and download only the tool you need.<br/>
 Step3:copy each line at a time of install_openPDK.sh and ensure no error is there. If its erroring out try to debug the reason using google search. <br/>       
Step 4: To run Xschem with sky130nm PDK do following thing cd to /usr/local/share/pdk/sky130A/libs.tech/xschem folder and type xschem press enter done , or alternatively copy xschemrc file from /usr/local/share/pdk/sky130A/libs.tech/xschem to any of your desire folder and run xschem.<br/>
step 5: to run magic with sky13nm pdk type "magic -T sky130A" press enter from any location <br/>
step 6: run ngspice,yosys,netgen with simply typeing there name and enter <br/>
step 7: detail tutorial are available in tool's official site.<br/>
