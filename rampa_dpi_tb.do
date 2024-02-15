vlib work
vcom rampa_pkg.vhd -work work
vcom Discrete_FIR_Filter.vhd -work work
vcom rampa.vhd -work work
vlog -dpicopyopt 0 -sv gm_rampa_ref_dpi.sv
vlog -sv rampa_dpi_tb.sv
vsim -voptargs=+acc -L work  -sv_lib gm_rampa_ref_win64 work.rampa_dpi_tb
add wave /*
run -all
