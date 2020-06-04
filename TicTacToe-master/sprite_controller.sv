module sprite_controller(
	input logic clk,
	input logic[9:0] x,
	input logic[9:0] y,
	output logic[7:0] VGA_RED,
	output logic[7:0] VGA_GREEN,
	output logic[7:0] VGA_BLUE
);

	logic [7:0] mem_r;
	logic [7:0] mem_g;
	logic [7:0] mem_b;
	logic [9:0] x_mem;
	logic [8:0] y_mem;
	assign x_mem = x-150;
	assign y_mem = y-100;
	
	sram #(16, 8, 40320, "C:/intelFPGA_lite/18.1/TicTacToe/Image processing/spriteVamoR.mem") sprite_R(clk, y_mem*224+x_mem, wren, 0, mem_r);
	sram #(16, 8, 40320, "C:/intelFPGA_lite/18.1/TicTacToe/Image processing/spriteVamoG.mem") sprite_G(clk, y_mem*224+x_mem, wren, 0, mem_g);
	sram #(16, 8, 40320, "C:/intelFPGA_lite/18.1/TicTacToe/Image processing/spriteVamoB.mem") sprite_B(clk, y_mem*224+x_mem, wren, 0, mem_b);
	
	always @*
	begin
		if(x_mem>0 && x_mem<224 && y_mem > 0 && y_mem < 180)
		begin
			VGA_RED = mem_r;
			VGA_GREEN = mem_g;
			VGA_BLUE = mem_b;
		end
		else
		begin
			VGA_RED = 8'b00000000;
			VGA_GREEN = 8'b00000000;
			VGA_BLUE = 8'b00000000;
		end
	end
	
endmodule
