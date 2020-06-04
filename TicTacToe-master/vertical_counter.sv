// Counter based
module vertical_counter (
	input clk_25MHz,
	input enable_V_Counter,
	output logic [15:0] v_Count_Value = 0
	);
	
	always @ (posedge clk_25MHz)
	begin
		if (enable_V_Counter == 1'b1)
		begin
			if (v_Count_Value < 524)
				v_Count_Value = v_Count_Value + 1;
			else
				v_Count_Value = 0; // Reset counter
		end
	end

endmodule
