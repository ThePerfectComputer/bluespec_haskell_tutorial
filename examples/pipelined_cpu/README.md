A small pipelined CPU example.

This example packages the standalone `CPU.bs` design into the tutorial
repository's normal example layout so it can be built with the shared
Makefile.

The CPU loads instructions from `imem.hex` and data from `dmem.hex`.

# Bluesim
```bash
make b_compile b_link b_sim
```

# Verilog
```bash
V_SIM=iverilog make v_compile v_link v_sim_vcd
```
