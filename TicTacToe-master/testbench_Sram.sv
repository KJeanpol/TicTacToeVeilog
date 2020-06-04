module testbench_Sram;

	logic clk = 0;
	logic [15:0] address = 16'b0;
	logic [7:0] sram_in = 1'b0;
	logic [7:0] sram_out;

	
	sram #(16, 8, 40320, "C:/intelFPGA_lite/18.1/TicTacToe/Image processing/spriteVamoR.mem")
	sprite_R(clk, address, 0, sram_in, sram_out);
	
	always #5 clk = ~clk;
	always #10 address = address + 1'b1;


endmodule
