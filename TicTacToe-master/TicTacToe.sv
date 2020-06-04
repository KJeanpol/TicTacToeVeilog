module TicTacToe(
	input CLOCK_50,
	input [9:0] SW,
	input move,
	input select,
	input reset,
	output [9:0] LEDR,
	output VGA_HS,
	output VGA_VS,
	output [7:0] VGA_R,
	output [7:0] VGA_G,
	output [7:0] VGA_B,
	output VGA_CLK,
	output VGA_SYNC_N,
	output VGA_BLANK_N
	);
	
	// Based on game logic
	// Will indicate video_controller what to show
	logic [1:0] block00;
	logic [1:0] block01;
	logic [1:0] block02;
	logic [1:0] block10;
	logic [1:0] block11;
	logic [1:0] block12;
	logic [1:0] block20;
	logic [1:0] block21;
	logic [1:0] block22;
	logic [3:0] selected;
	logic [3:0] outCont;
   wire [1:0] pos1,pos2,pos3,
    pos4,pos5,pos6,pos7,pos8,pos9;
	 
	wire Px,Po;
	wire[1:0]who;
	contador cont(move,outCont);
	selector sel (select,~reset,Px,Po);
	
	tic_tac_toe_game JUEGO (
     CLOCK_50, // clock of the game 
     ~reset, // reset button to reset the game 
     Px, // play button to enable player to play 
     Po, // pc button to enable computer to play 
     outCont, 
	  outCont,
     pos1,pos2,pos3,
     pos4,pos5,pos6,pos7,pos8,pos9,
     // LED display for positions 
     // 01: Player 
     // 10: Computer 
     who 
     // who the winner is 
     );
	

	// ****************** PLEASE MODIFY THIS VALUES BASED ON THE GAME LOGIC :) *******************
	// Sprite selectors: 00 or 11 = no sprite, 01 = sprite 1, 10 = sprite 2
	// Block 00
	assign block00 = pos1;
	// Block 01
	assign block01 = pos2;
	// Block 02
	assign block02 = pos3;
	// Block 10
	assign block10 = pos4;
	// Block 11
	assign block11 = pos5;
	// Block 12
	assign block12 = pos6;
	// Block 20
	assign block20 = pos7;
	// Block 21
	assign block21 = pos8;
	// Block 22
	assign block22 = pos9;
	
	
	always@*
	begin
		if(who==2'b00)
		selected <= outCont;
		else
		selected <= 4'b1111;
	end
	// *******************************************************************************************
	
	
	
	video_controller VGA (
	CLOCK_50,
	block00,
	block01,
	block02,
	block10,
	block11,
	block12,
	block20,
	block21,
	block22,
	selected,
	VGA_HS,
	VGA_VS,
	VGA_R,
	VGA_G,
	VGA_B,
	VGA_CLK,
	VGA_SYNC_N,
	VGA_BLANK_N);
	
endmodule
