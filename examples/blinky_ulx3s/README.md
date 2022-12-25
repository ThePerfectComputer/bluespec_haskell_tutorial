A simple blinky example meant to be programmed into the ULX3S FPGA.

The design build process is split up into two parts: simulation and Verilog generation.
To change between simulating and generating verilog, the top module must be specified
using ``TOPMODULE=``, for example:

``TOPMODULE=mkSim make b_compile b_link b_sim`` to simulate and

``TOPMODULE=mkBlinky make v_compile`` to generate verilog. The generated verilog can
be found in the ``verilog_RTL/`` folder.

# Simulation
```bash
TOPMODULE=mkSim make b_compile b_link b_sim

# some output snipped
Bluesim simulation ...
./mkSim_b_sim
         0
led = 1
         1
led = 0
         2
led = 1
         3
led = 0
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