module testbench_TicTacToe;

	logic Hsynq;
	logic Vsynq;
	logic [3:0] Red;
	logic [3:0] Green;
	logic [3:0] Blue;
	logic clk_25MHz;
	logic sync_N;
	logic blank_N;
	
	TicTacToe ttt (Hsynq, Vsynq, Red, Green, Blue, clk_25MHz, sync_N, blank_N);
	
endmodule