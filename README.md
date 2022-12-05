This repository is intended to house some(hopefully) helpful examples for Bluespec Haskell/Classic(BH).

If this is your first exposure to Bluespec, and you have the option to choose
between learning Bluespec Verilog or Bluespec Haskell, I personally recommend learning 
the latter as I find its syntax a bit more natural.

You can run each example by changing into the respective folder such as ``example/hello_world`` and running a make command or command sequence such as ``make b_compile b_link b_sim_vcd``.

You'll need to have the bluespec compiler installed of course which you can either install from [sources](https://github.com/B-Lang-org/bsc/blob/main/INSTALL.md#compiling-bsc-from-source) or from a downloaded [release](https://github.com/B-Lang-org/bsc/releases/tag/2022.01).

To build from source on MacOS Ventura, you may need to modify [this file](https://github.com/B-Lang-org/bsc/blob/af852df596fcf41f578978c89765adcb6d4839f9/platform.mk#L54) to have the following after ``endif`` but before ``export CFLAGS``:

```make
CFLAGS += -Wno-deprecated-declarations
CXXFLAGS += -Wno-deprecated-declarations
```

## Useful References

Below is some documentation that one may find helpful when reading through the examples included in this repository. The Bsc Library guide should prove particularly helpful.

I personally find the verilog variant of bluespec(BSCV) to be a bit unnatural as it feels like somebody to haskell and tried to make it look like verilog, but the BSV references below have some useful information with respect to the bsc ecosystem as a whole, so I've included them.

1. [Bsc Library Guide](https://github.com/B-Lang-org/bsc/releases/download/2022.01/bsc_libraries_ref_guide.pdf)
2. [Bsc User Guide](https://github.com/B-Lang-org/bsc/releases/download/2022.01/bsc_user_guide.pdf)
3. [Bsc Classic(Haskell)](https://github.com/B-Lang-org/Documentation/raw/master/Language_Spec/bsv-reference-guide.pdf)
4. [BSV Reference Guide](https://github.com/B-Lang-org/Documentation/raw/master/Language_Spec/bsv-reference-guide.pdf)
5. [BSV By Example](http://csg.csail.mit.edu/6.S078/6_S078_2012_www/resources/bsv_by_example.pdf)

## Suggested Approach

Since this is a tutorial on using bluespec classic(not bluespec verilog), it can be
helpful to approach writing bluespec code as you would writing haskell code.

To this end, learning about haskell concepts such as 
[ADTs](https://wiki.haskell.org/Algebraic_data_type) or the 
[dollar sign](https://typeclasses.com/featured/dollar) can be helpful.

Many concepts from haskell will likely carry over.

Haskell is often presented as being hard to approach, but with the right amount of
dedication, I would like to claim that Haskell can become approachable and often 
even erfreshing and beautiful - as long as you stay away from going crazy with custom
operators and custom operator precedence.

Below, I suggest an order in which the included example should be examined:

## Suggested Order

1. [hello_world](./examples/hello_world/)

    First start with the hello world example to help grasp the basics of invoking a makefile which invoke the bluespec compiler. The underlying makefile is can be found [here](./Include_Makefile.mk) and should make sense after about 30 minutes of study.

    This example also provides some exposure to setting type contraints on functions.

2. [Cyclic Alu State Machine](./examples/state_machine/)

    This example should provide some exposure to splitting importing files as well as
    enumerate state implemented a sum type, with BlueSpec's algebraic-data-type type
    system.

3. [Cyclic Alu State Machine with Interface](./examples/state_machine_with_interface/)

    This example provides some exposure to interfaces, as well as setting type 
    contraints on module types.

# Other Dependencies

You will need ``verilator`` and ``icarus-verilog`` if you wish to try other simulators besides ``bsim``.

On MacOS, you can do:

```bash
brew icarus-verilog verilator
```