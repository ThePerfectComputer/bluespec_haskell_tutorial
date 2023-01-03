package Top;
import GetPut::*;

import FIFO::*;

module mkTop(Tuple2#(Get#(UInt#(32)), Put#(UInt#(32))));
  FIFO#(UInt#(32)) fifo();
  mkFIFO the_fifo(fifo);
  return(tuple2(interface Get
		  method get() ;
		    actionvalue
		      return(((UInt#(32))'(4)));
		    endactionvalue
		  endmethod: get
		endinterface: Get,
		interface Put
		  method put(a) ;
		    actionvalue
		      (fifo.enq)(a);
		    endactionvalue
		  endmethod: put
		endinterface: Put));
endmodule: mkTop

interface Blinky;
    method Bit#(8) led();
endinterface: Blinky

(* always_ready *)
module mkBlinky(Blinky);
  let counter <- mkReg(((UInt#(32))'(0)));
  rule incr (True);
     counter <= counter + 1;
  endrule: incr
  method led() ;   return ((pack(counter))[29:22]);
  endmethod: led
endmodule: mkBlinky

module mkSim(Empty);
  let dut <- mkBlinky;
  let old_led_val <- mkReg(((Bit#(8))'(0)));
  let cycle <- mkReg(((UInt#(32))'(0)));
  let alerts <- mkReg(((UInt#(32))'(0)));
  rule incr_cycle (True);
     cycle <= cycle + 1;
  endrule: incr_cycle
  rule follow_led (True);
     old_led_val <= dut.led;
  endrule: follow_led
  rule notify_change (old_led_val != dut.led);
     ($display)("cycle = ", cycle);
     ($display)("dut.led = ", dut.led);
     alerts <= alerts + 1;
  endrule: notify_change
  rule end_sim (alerts == 6);
     ($finish)();
  endrule: end_sim
endmodule: mkSim

endpackage: Top

