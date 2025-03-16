A small example showing how one might create interfaces for connecting a BusClient to a
Bus Client.

Try swappping the order of the rules between lines 12 and 13 to see how firing order/timing changes in bsim, but not in verilator nor iverilog.


# Bsim
```bash
make b_compile b_link b_sim

# some output snipped
Bluesim simulation ...
./mkTop_b_sim
Hello World.         0
Hello World.        10
         0
Hello World.        20
         1
Hello World.        30
         2
Hello World.        40
         3
Hello World.        50
Bluesim simulation finished
```

# Verilator

```bash
V_SIM=verilator make v_compile v_link v_sim_vcd

Verilog simulation and dumping VCD in dump.vcd ...
./mkTop_v_sim  +bscvcd
Enabling waves into dump.vcd...
Hello World.         5
         0
Hello World.        15
         1
Hello World.        25
         2
Hello World.        35
         3
Hello World.        45
- verilog_RTL/mkTop.v:116: Verilog $finish
```

# Icarus
```bash
V_SIM=iverilog make v_compile v_link v_sim_vcd

Verilog simulation and dumping VCD in dump.vcd ...
./mkTop_v_sim  +bscvcd
VCD info: dumpfile dump.vcd opened for output.
Hello World.         5
         0
Hello World.        15
         1
Hello World.        25
         2
Hello World.        35
         3
Hello World.        45
Verilog simulation and dumping VCD in dump.vcd finished
```
