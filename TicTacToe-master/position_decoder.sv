// fpga4student.com: FPGA projects, Verilog projects, VHDL projects
// To decode the position being played, a 4-to-16 decoder with high active output is needed.
// When a button is pressed, a player will play and the position at IN [3:0] will be decoded
// to enable writing to the corresponding registers
module position_decoder(input[3:0] in, input enable, output wire [15:0] out_en);
 reg[15:0] temp1;
 assign out_en = (enable==1'b1)?temp1:16'd0;
 always @(*)
 begin
 case(in)
 4'd0: temp1 <= 16'b0000000000000001;
 4'd1: temp1 <= 16'b0000000000000010; 
 4'd2: temp1 <= 16'b0000000000000100;
 4'd3: temp1 <= 16'b0000000000001000;
 4'd4: temp1 <= 16'b0000000000010000;
 4'd5: temp1 <= 16'b0000000000100000;
 4'd6: temp1 <= 16'b0000000001000000;
 4'd7: temp1 <= 16'b0000000010000000;
 4'd8: temp1 <= 16'b0000000100000000;
 4'd9: temp1 <= 16'b0000001000000000;
 4'd10: temp1 <= 16'b0000010000000000;
 4'd11: temp1 <= 16'b0000100000000000;
 4'd12: temp1 <= 16'b0001000000000000;
 4'd13: temp1 <= 16'b0010000000000000;
 4'd14: temp1 <= 16'b0100000000000000;
 4'd15: temp1 <= 16'b1000000000000000;
 default: temp1 <= 16'b0000000000000001; 
 endcase 
end 
endmodule 