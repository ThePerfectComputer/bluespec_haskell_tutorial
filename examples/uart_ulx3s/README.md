The humble beginnings of a UART loopback.

``TOPMODULE=mkTop make v_compile`` to generate verilog. The generated verilog can
be found in the ``verilog_RTL/`` folder.

# Dependencies
You'll need to install:
1. [Yosys](https://github.com/YosysHQ/yosys) at git commit: 7ce5011c24b
2. [nextpnr-0.4-36-gc8406b71](https://github.com/YosysHQ/nextpnr)
3. [PrjTrellis](https://github.com/YosysHQ/prjtrellis) at git commit: 1.2.1-22-g35f5aff
4. [openFPGALoader](https://github.com/trabucayre/openFPGALoader)

# Programming the ULX3S
Change into the folder containing this README, and then run ``

```bash
make -C ulx3s_fpga
# You may need the following line to set your screen device config
# to one parity and one stop bit. Tested working on MacOS, should
# work on Linux.
stty -f /dev/tty.usbserial-K00027 -cstopb -parenb
screen /dev/tty.usbserial-K00027 9600
```

# Simulation
TODO

# Generating Verilog

```bash
TOPMODULE=mkTop make v_compile
```