transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/TicTacToe {C:/intelFPGA_lite/18.1/TicTacToe/contador.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/TicTacToe {C:/intelFPGA_lite/18.1/TicTacToe/winner_detect_3.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/TicTacToe {C:/intelFPGA_lite/18.1/TicTacToe/winner_detector.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/TicTacToe {C:/intelFPGA_lite/18.1/TicTacToe/tic_tac_toe_game.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/TicTacToe {C:/intelFPGA_lite/18.1/TicTacToe/position_registers.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/TicTacToe {C:/intelFPGA_lite/18.1/TicTacToe/position_decoder.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/TicTacToe {C:/intelFPGA_lite/18.1/TicTacToe/nospace_detector.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/TicTacToe {C:/intelFPGA_lite/18.1/TicTacToe/illegal_move_detector.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/TicTacToe {C:/intelFPGA_lite/18.1/TicTacToe/fsm_controller.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/TicTacToe {C:/intelFPGA_lite/18.1/TicTacToe/video_controller.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/TicTacToe {C:/intelFPGA_lite/18.1/TicTacToe/clock_divider.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/TicTacToe {C:/intelFPGA_lite/18.1/TicTacToe/sram.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/TicTacToe {C:/intelFPGA_lite/18.1/TicTacToe/TicTacToe.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/TicTacToe {C:/intelFPGA_lite/18.1/TicTacToe/horizontal_counter.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/TicTacToe {C:/intelFPGA_lite/18.1/TicTacToe/vertical_counter.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/TicTacToe {C:/intelFPGA_lite/18.1/TicTacToe/selector.sv}

