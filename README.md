This repository is intended to house some(hopefully) helpful example for Bluespec Haskell.

You can run each example by changing into the respective folder such as ``example/hello_world`` and running a make command or command sequence such as ``make b_compile b_link b_sim_vcd``.

You'll need to have the bluespec compiler installed of course which you can either install from [sources](https://github.com/B-Lang-org/bsc/blob/main/INSTALL.md#compiling-bsc-from-source) or from a downloaded [release](https://github.com/B-Lang-org/bsc/releases/tag/2022.01).

To build from source on MacOS Ventura, you may need to modify [this file](https://github.com/B-Lang-org/bsc/blob/af852df596fcf41f578978c89765adcb6d4839f9/platform.mk#L54) to have the following after ``endif`` but before ``export CFLAGS``:

```make
CFLAGS += -Wno-deprecated-declarations
CXXFLAGS += -Wno-deprecated-declarations
```