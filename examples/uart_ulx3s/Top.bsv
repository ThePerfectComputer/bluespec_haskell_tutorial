package Top;
import List::*;

import GetPut::*;

typedef enum {
  Idle, Capturing, Done, Error} RxState deriving (Bits, Eq, FShow);

interface (Counter :: # -> *) #(type hi);
    method Action reset();
    method ActionValue#(Bool) isSaturated();
endinterface: (Counter :: # -> *)

module mkCounter(Counter#(hi));
  let counter <- mkReg(((UInt#(TLog#(hi)))'(0)));
  UInt#(TLog#(hi)) hi_value;
  hi_value = fromInteger(primValueOf(((Bit#(hi))'(?))));
  rule count (True);
     ($display)(counter);
     counter <=
     begin case (counter) matches
	   hi_value :  (0);
	   .* :  (counter + 1);
	   endcase
     end;
  endrule: count
  method reset() ;
    actionvalue
      counter <= 0;
    endactionvalue
  endmethod: reset
  method isSaturated() ;
    actionvalue
      return(counter == hi_value);
    endactionvalue
  endmethod: isSaturated
endmodule: mkCounter

interface UartRx;
    method Action put_rx_bit(Bit#(1) x1);
    method ActionValue#(Char) get_rx_char();
endinterface: UartRx

module mkTop(Empty);
  let sync_regs <- replicateM(2, mkReg(((UInt#(2))'(0))));
  List#(UInt#(32)) list1;
  list1 = map(fromInteger, upto(1, 4));
  List#(UInt#(32)) list2;
  list2 = map(fromInteger, upto(2, 9));
  let list3 =  zip(list1, list2);
  let counter <- mkReg(((UInt#(32))'(0)));
  rule reg_chain (True);
     sync_regs !! 0 <= readReg(sync_regs !! 1);
  endrule: reg_chain
  rule simulate (counter < 5);
     counter <= counter + 1;
     (counter == 1 ?
	  (actionvalue
	     ($finish)();
	   endactionvalue)
      :   (action
	   endaction));
     ($display)(fshow(list3));
  endrule: simulate
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
  Counter#(3) my_counter();
  mkCounter the_my_counter(my_counter);
  let cycle <- mkReg(((UInt#(32))'(0)));
  rule incr_cycle (True);
     cycle <= cycle + 1;
     ($display)("my_counter ", my_counter.isSaturated);
  endrule: incr_cycle
  rule end_sim (cycle == 6);
     ($finish)();
  endrule: end_sim
endmodule: mkSim

endpackage: Top

