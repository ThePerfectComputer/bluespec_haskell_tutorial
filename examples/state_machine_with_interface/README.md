In Progress

An state machine that cycles an ALU between the ``Add``, ``Subtract``, and ``Multiply`` states.

Unlike the [state_machin](../state_machine/) example which has the alu as the top,
module, the alu in this example is contained in it own module in its own file, and
provides an interface.

# Bsim
```bash
make b_compile b_link b_sim

TODO
```

# Verilator

```bash
V_SIM=verilator make v_compile v_link v_sim_vcd

TODO
```

# Icarus
```bash
V_SIM=iverilog make v_compile v_link v_sim_vcd

TODO
```