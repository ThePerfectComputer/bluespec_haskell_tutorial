A simple blinky example meant to be programmed into the ULX3S FPGA.

The design build process is split up into two parts: simulation and Verilog generation.
To change between simulating and generating verilog, the top module must be specified
using ``TOPMODULE=``, for example:

``TOPMODULE=mkSim make b_compile b_link b_sim`` to simulate and

``TOPMODULE=mkBlinky make v_compile`` to generate verilog. The generated verilog can
be found in the ``verilog_RTL/`` folder.

# Programming the ULX3S
Change into the folder containing this README, and then run ``make -C ulx3s_fpga``.

You'll need to install:
1. [Yosys](https://github.com/YosysHQ/yosys) at git commit: 7ce5011c24b
2. [nextpnr-0.4-36-gc8406b71](https://github.com/YosysHQ/nextpnr)
3. [PrjTrellis](https://github.com/YosysHQ/prjtrellis) at git commit: 1.2.1-22-g35f5aff
4. [openFPGALoader](https://github.com/trabucayre/openFPGALoader)

# Simulation
```bash
TOPMODULE=mkSim make b_compile b_link b_sim

# some output snipped
Bluesim simulation ...
./mkSim_b_sim
cycle =    4194304
dut.led =   1
cycle =    8388608
dut.led =   2
cycle =   12582912
dut.led =   3
cycle =   16777216
dut.led =   4
cycle =   20971520
dut.led =   5
cycle =   25165824
dut.led =   6
Bluesim simulation finished
```

# Generating Verilog

```bash
TOPMODULE=mkBlinky make v_compile

# some output truncated
compiling src/Top.bs
code generation for mkBlinky starts
Verilog file created: verilog_RTL/mkBlinky.v
All packages are up to date.
Compiling for Verilog finished
```