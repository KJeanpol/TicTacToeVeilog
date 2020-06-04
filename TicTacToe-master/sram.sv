module sram #(parameter ADDRESS_WIDTH=8, DATA_WIDTH=8, DEPTH=256, MEMFILE="")(
	input logic clk,
	input logic [ADDRESS_WIDTH-1:0] address,
	input logic rw,
	input logic [DATA_WIDTH-1:0] sram_in,
	output logic [DATA_WIDTH-1:0] sram_out
);

	logic [DATA_WIDTH-1:0] memory_array [0:DEPTH-1];
	initial begin
		$readmemh(MEMFILE, memory_array);
	end
	
	always @(posedge clk)
	begin
		if (rw) begin
			memory_array[address] = sram_in;
		end
		else begin
			sram_out = memory_array[address];
		end
	end
endmodule
