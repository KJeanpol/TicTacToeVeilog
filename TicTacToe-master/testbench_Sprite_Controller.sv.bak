module testbench_Video_Controller;

	logic clk = 0;
	logic Hsynq;
	logic Vsynq;
	logic [3:0] Red;
	logic [3:0] Green;
	logic [3:0] Blue;
	logic clk_25MHz;
	logic sync_N;
	logic blank_N;
	
	video_controller UUT (clk, Hsynq, Vsynq, Red, Green, Blue, clk_25Mhz, sync_N, blank_N);
	
	always #5 clk = ~clk;
	
endmodule
