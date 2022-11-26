An state machine that cycles an ALU between the ``Add``, ``Subtract``, and ``Multiply`` states.

# Bsim
```bash
make b_compile b_link b_sim

Compiling for Bluesim finished
Bluesim simulation ...
./mkTop_b_sim
cycle =          0
alu.o =          22
state = Add
cycle =          1
alu.o =          -2
state = Subtract
cycle =          2
alu.o =         120
state = Multiply
cycle =          3
alu.o =          22
state = Add
Bluesim simulation finished
```

# Verilator

```bash
V_SIM=verilator make v_compile v_link v_sim_vcd

Verilog binary file created: ./mkTop_v_sim
Linking for Verilog sim finished
Verilog simulation...
./mkTop_v_sim
cycle =          0
alu.o =          22
state = Add
cycle =          1
alu.o =          -2
state = Subtract
cycle =          2
alu.o =         120
state = Multiply
cycle =          3
alu.o =          22
state = Add
- verilog_RTL/mkTop.v:176: Verilog $finish
alu.o =          -2
state = Subtract
Verilog simulation finished
```

# Icarus
```bash
V_SIM=iverilog make v_compile v_link v_sim_vcd

Verilog binary file created: ./mkTop_v_sim
Linking for Verilog sim finished
Verilog simulation...
./mkTop_v_sim
cycle =          0
alu.o =          22
state = Add
cycle =          1
alu.o =          -2
state = Subtract
cycle =          2
alu.o =         120
state = Multiply
cycle =          3
alu.o =          22
state = Add
Verilog simulation finished
```