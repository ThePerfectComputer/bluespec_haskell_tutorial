In Progress

An state machine that cycles an ALU between the ``Add``, ``Subtract``, and ``Multiply`` states.

Unlike the [state_machin](../state_machine/) example which has the alu as the top,
module, the alu in this example is contained in it own module in its own file, and
provides an interface.

# Bsim
```bash
make b_compile b_link b_sim

# some output snipped
Bluesim simulation ...
./mkTop_b_sim
cycle =          0
cyclic_alu.z =          22
cyclic_alu.state = Add

cycle =          1
cyclic_alu.z =          -2
cyclic_alu.state = Subtract

cycle =          2
cyclic_alu.z =         120
cyclic_alu.state = Multiply

cycle =          3
cyclic_alu.z =          22
cyclic_alu.state = Add

Bluesim simulation finished
```

# Verilator

```bash
V_SIM=verilator make v_compile v_link v_sim_vcd

# some output snipped
Verilog simulation and dumping VCD in dump.vcd ...
./mkTop_v_sim  +bscvcd
Enabling waves into dump.vcd...
cycle =          0
cyclic_alu.z =          22
cyclic_alu.state = Add

cycle =          1
cyclic_alu.z =          -2
cyclic_alu.state = Subtract

cycle =          2
cyclic_alu.z =         120
cyclic_alu.state = Multiply

cycle =          3
cyclic_alu.z =          22
cyclic_alu.state = Add

- verilog_RTL/mkTop.v:174: Verilog $finish
cyclic_alu.z =          -2
cyclic_alu.state = Subtract

Verilog simulation and dumping VCD in dump.vcd finished
```

# Icarus
```bash
V_SIM=iverilog make v_compile v_link v_sim_vcd

# some output snipped
Verilog simulation and dumping VCD in dump.vcd ...
./mkTop_v_sim  +bscvcd
VCD info: dumpfile dump.vcd opened for output.
cycle =          0
cyclic_alu.z =          22
cyclic_alu.state = Add

cycle =          1
cyclic_alu.z =          -2
cyclic_alu.state = Subtract

cycle =          2
cyclic_alu.z =         120
cyclic_alu.state = Multiply

cycle =          3
cyclic_alu.z =          22
cyclic_alu.state = Add

Verilog simulation and dumping VCD in dump.vcd finished
```