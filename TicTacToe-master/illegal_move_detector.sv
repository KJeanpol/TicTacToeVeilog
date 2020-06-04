// Illegal move detector
// to detect if a player plays on an exist position 
// fpga4student.com: FPGA projects, Verilog projects, VHDL projects
module illegal_move_detector(
   input [1:0] pos1,pos2,pos3,pos4,pos5,pos6,pos7,pos8,pos9, 
   input [8:0] PC_en, PL_en, 
   output wire illegal_move
   );
wire temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8,temp9;
wire temp11,temp12,temp13,temp14,temp15,temp16,temp17,temp18,temp19;
wire temp21,temp22;
// player : illegal moving    
assign temp1 = (pos1[1] | pos1[0]) & PL_en[0];
assign temp2 = (pos2[1] | pos2[0]) & PL_en[1];
assign temp3 = (pos3[1] | pos3[0]) & PL_en[2];
assign temp4 = (pos4[1] | pos4[0]) & PL_en[3];
assign temp5 = (pos5[1] | pos5[0]) & PL_en[4];
assign temp6 = (pos6[1] | pos6[0]) & PL_en[5];
assign temp7 = (pos7[1] | pos7[0]) & PL_en[6];
assign temp8 = (pos8[1] | pos8[0]) & PL_en[7];
assign temp9 = (pos9[1] | pos9[0]) & PL_en[8];
// computer : illegal moving  
assign temp11 = (pos1[1] | pos1[0]) & PC_en[0];
assign temp12 = (pos2[1] | pos2[0]) & PC_en[1];
assign temp13 = (pos3[1] | pos3[0]) & PC_en[2];
assign temp14 = (pos4[1] | pos4[0]) & PC_en[3];
assign temp15 = (pos5[1] | pos5[0]) & PC_en[4];
assign temp16 = (pos6[1] | pos6[0]) & PC_en[5];
assign temp17 = (pos7[1] | pos7[0]) & PC_en[6];
assign temp18 = (pos8[1] | pos8[0]) & PC_en[7];
assign temp19 = (pos9[1] | pos9[0]) & PC_en[8];
// intermediate signals 
assign temp21 =((((((((temp1 | temp2) | temp3) | temp4) | temp5) | temp6) | temp7) | temp8) | temp9);
assign temp22 =((((((((temp11 | temp12) | temp13) | temp14) | temp15) | temp16) | temp17) | temp18) | temp19);
// output illegal move 
assign illegal_move = temp21 | temp22 ;
endmodule 