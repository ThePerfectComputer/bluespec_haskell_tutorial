# bluetcl sim_inspect.tcl
namespace import ::Bluetcl::*
package require Bluesim

sim load simBRAM.so mkTestbench
set count_hdl [sim lookup count]
set bram [sim lookup dut1_memory]

sim step
sim step
sim step

puts "Value of count: [sim get $count_hdl]"
puts "Value of bram\[0:3\]: [sim getrange $bram 0 3]"
