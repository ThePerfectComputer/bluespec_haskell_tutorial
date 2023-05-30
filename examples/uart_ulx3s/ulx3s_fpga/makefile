BSV_PATH=$(shell dirname $(shell which bsc))/..
BSV_LIBS=$(BSV_PATH)/lib/Verilog
TOPMODULE=mkTop
IDCODE ?= 0x41113043 # 85f

all: prog

../verilog_RTL/$(TOPMODULE).v: ../src/Top.bs
	V_SIM=verilator TOPMODULE=$(TOPMODULE) make -C ../ v_compile

$(TOPMODULE).json: ../verilog_RTL/$(TOPMODULE).v
	yosys \
		-p "synth_ecp5 -top $(TOPMODULE) -json $@" \
		-E $(TOPMODULE).d \
		$< \
		$(BSV_LIBS)/Counter.v

$(TOPMODULE).config: $(TOPMODULE).json
	nextpnr-ecp5 \
		--json $< \
		--textcfg $@ \
		--lpf ulx3s_v20.lpf \
		--85k \
		--package CABGA381

$(TOPMODULE).bit: $(TOPMODULE).config
	ecppack --idcode $(IDCODE) $< $@

.PHONY: prog
prog: $(TOPMODULE).bit
	openFPGALoader -f -b ulx3s $<

.PHONY: clean
clean:
	rm -rf *.json *.config *.bit *.d
	make -C ../ clean