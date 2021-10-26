# VHDL for beginners

## Proposal of the repository

In this git repository I will try to initiate you to the VHDL language. My aim is to provide you the basic tools to be able to compile your source codes and to simulate their behaviour with a graphical software which shows the signals' behaviour inside your codes. 

#### VHDL brief introduction
VHDL, or better VHSIC-HDL (Very High Speed Integrated Circuit Hardware Description Language), is a hardware description language, used in electronic design automatation to describe digital and mixed signal systems such as FPGAs (Field Programmable Gate Arrays) and ASICs (Application Specific Integrated Circuits). 

A VHDL project development is divided into 4 phases:

- *Register Transfer Level (RTL)*: i.e. the source codes which, through the libraries provided by the language, includes the "built"  electronic circuit of interest (so called Architecture);
- *Simulation*: test of the built circuit by setting the input signals and studying the output ones (this part is still done in software);
- *Synthesis*: creation of the logic scheme and instantiation of the for a generic FPGA (not specific one) and creation of a list of needed components to be implemented (Netlist);
- *Implementation*: physical implementation of the type and number of components on a real FPGA (of course different FPGAs have different features). 
The last two parts of the project development may be done only if a physical hardware is present, maybe even with more sofisticated programs. I am currently learning how to develop complete hardware designs in [Vivado](https://www.xilinx.com/products/design-tools/vivado.html), but since it is required a licence and specially the program size is quite huge, only the first two steps will be developed with a free and easy-to-handle tool.

#### GHDL installation and compiler 
First of all, I strong suggest to use a Linux based bash. There is no need to install a Virtual machine: if you are using Windows 10 you may install WLS2 (lit. "Windows Subsystem for Linux 2"). There are few guides which can be followed online, i suggest you to  follow the one proposed by [Microsoft](https://docs.microsoft.com/en-us/windows/wsl/install). If you already use a Unix-base system, you may find some probable mis-match in the directories or some commands, but it all can be fixed. If you accomplished this task, you may proceed. 

There are many free compiler you can find online, but to execute the codes in this repository I suggest to use GHDL, which suits perfectly for the pourposes of this project. Beware, this software in not able to provide a Synthesis phase (thus no netlist will be produced).

To install GHDL, your computer needs a GCC compiler, so before doing the following steps be sure to have a GCC compiler. If not, check out how to install it at this [link](https://linuxize.com/post/how-to-install-gcc-compiler-on-ubuntu-20-04/). 

Once you are sure, you can go on. Here is a simple tutorial to install and compile in GHDL.
From your power shell type the following lines to install and to clone the [GHDL](https://github.com/ghdl/ghdl) repository:
```
sudo apt update
sudo apt-get upgrade
sudo apt-get install build-essential
sudo apt install -y git make gnat zlib1g-dev
git clone https://github.com/ghdl/ghdl
cd ghdl
./configure --prefix=/usr/local
make
sudo make install
```

This commands should work on Unix systems (I personally used Ubuntu 18.04.4 and it worked, I upgrade at Ubuntu 20.04 and it works, but again, check the details for you operative system). For additional notes ad hints on installation please check the [GHDL-install](http://ghdl.free.fr/site/pmwiki.php?n=Main.Installation) site.
GHDL does not provide any graphical displayer, so to display the signals of the source code and of the test bench you have to install another free software for graphical visualization of the electronic signals [GKTwave](http://gtkwave.sourceforge.net/):```sudo apt-get install gtkwave```

So far, if everything has been done correctly up to this point, you should now be able to used all the needed tools.
In GHDL many commands are available. For example:

- ```ghdl -s``` makes a syntax check of the files (do it if you are beginners, it will help you a lot);
- ```ghdl -a``` analyze the files;
- ```ghdl -e``` elaborate the defined units in the files (Architecture);
- ```ghdl -r``` runs the files, generating a waveform file which can be displayed.

These the most basilar commands to use, for deeper details for the various compiling options you can type from the shell the option ```ghdl --help```.

The following lines are a simple example on how to check, analyze, execute and run the files and eventually display them in the GTKwave software: 
```
cd ~/path/to/the/repository/
ghdl -a your_source.vhd
ghdl -a your_test_bench.vhd
ghdl -e test_bench 
ghdl -r test_bench --vcd=waves.vcd 
gtkwave waves.vcd
```

The source files in general embed the **Architecture**, i.e. the main circuit that has to be simulated, synthetized and eventually implemented on a physical hardware device. The simulation part assign values chosen by the user to verify the correct functioning of the **Architecture** implemented.

Notice that the actual compilation and run of a fle can be modulated with several options: for instance the simulation files ```.vcd``` displays the waveforms in fuction of the time, and the "simulation" time may be displayed on your shell with the addition of the command ```--disp-time``` in the run line. Once the simulation file is created, the outline options are at the user discretion (I won't list them all, at this [simulation option](http://ghdl.free.fr/ghdl/Simulation-options.html) page you can discover whatever you will need). 

Last advice, you will discover by yourself that simulations will run infinitely (or better util your RAM will abbandon you) once they are launched. So, if you forget to insert the stop condition in your ```test_bench.vhd``` file: DON'T PANIC!, just press ```ctrl + z``` on your bash to interrupt the process and fix your file.


## A simple example

I added to this repository a very trivial example, but in my opinion a good starting point. Check out the ```tunnel_example``` folder, download the codes and try yourself to display the waveform from your bash. 



