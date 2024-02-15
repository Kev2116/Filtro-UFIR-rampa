onbreak resume
onerror resume
vsim -novopt work.rampa_tb

add wave sim:/rampa_tb/u_rampa/clk
add wave sim:/rampa_tb/u_rampa/in1
add wave sim:/rampa_tb/u_rampa/out_rsvd
add wave sim:/rampa_tb/out_rsvd_ref
set ::dut_prefix /rampa_tb/u_
do rampa_noresetinitscript.tcl
run -all
