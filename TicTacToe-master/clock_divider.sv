// Counter based
module clock_divider #(parameter div_value = 0) (
	input logic clk, // 50 MHz
	output logic divided_clk = 0 // 25 MHz
);

	// Division value = 100 MHz / (2 * desired frequency) - 1
	// Counter
	integer counter_value = 0; // 32 bit wide bus

	always @ (posedge clk)
	begin
		// Keep counting until division
		if (counter_value == div_value)
		begin
			counter_value = 0;
			divided_clk = ~divided_clk;
		end
		else
		begin
			counter_value = counter_value + 1;
		end
	end
endmodule
