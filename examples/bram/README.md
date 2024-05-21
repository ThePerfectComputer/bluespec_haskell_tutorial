# About

Trying to get a feel for what might constitute a good flow when
needing to inspect simulated memories in Bluespec.

Here, we simulate a small BRAM and try to print out some of its 
values in TCL.

# Compiling and Simulating 

## Without TCL

```bash
bsc -sim -u -g mkTestbench Testbench.bs; bsc -sim -e mkTestbench -o simBRAM;
./simBRAM -V
```

## With TCL

```bash
bsc -sim -u -g mkTestbench Testbench.bs; bsc -sim -e mkTestbench -o simBRAM;
bluetcl sim_inspect.tcl
```