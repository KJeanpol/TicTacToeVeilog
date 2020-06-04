module deco(input [2:0] color,
			output logic [23:0] RGB);
			
always_comb
		case(color)
		3'd0: RGB = 24'hAAAAAA;
		3'd1: RGB = 24'h000000;
		3'd2: RGB = 24'hFFFFFF;
		3'd3: RGB = 24'hFF1551;
		3'd4: RGB = 24'h777777;
		3'd5: RGB = 24'h898989;
		3'd6: RGB = 24'h454545;
		3'd7: RGB = 24'h768976;
		endcase
endmodule 