transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/TicTacToe {C:/intelFPGA_lite/18.1/TicTacToe/clock_divider.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/TicTacToe {C:/intelFPGA_lite/18.1/TicTacToe/TicTacToe.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/TicTacToe {C:/intelFPGA_lite/18.1/TicTacToe/horizontal_counter.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/TicTacToe {C:/intelFPGA_lite/18.1/TicTacToe/vertical_counter.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/TicTacToe {C:/intelFPGA_lite/18.1/TicTacToe/top.sv}

