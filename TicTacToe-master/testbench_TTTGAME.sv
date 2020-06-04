// Verilog testbench code for TIC TAC TOE GAME 

module testbench_TTTGAME;

 // Inputs
 reg clock;
 reg reset;
 reg play;
 reg pc;
 reg [3:0] computer_position;
 reg [3:0] player_position;

 // Outputs
 wire [1:0] pos_led1;
 wire [1:0] pos_led2;
 wire [1:0] pos_led3;
 wire [1:0] pos_led4;
 wire [1:0] pos_led5;
 wire [1:0] pos_led6;
 wire [1:0] pos_led7;
 wire [1:0] pos_led8;
 wire [1:0] pos_led9;
 wire [1:0] who;

 // Instantiate the Unit Under Test (UUT)
 tic_tac_toe_game uut (
  .clock(clock), 
  .reset(reset), 
  .play(play), 
  .pc(pc), 
  .computer_position(computer_position), 
  .player_position(player_position), 
  .pos1(pos_led1), 
  .pos2(pos_led2), 
  .pos3(pos_led3), 
  .pos4(pos_led4), 
  .pos5(pos_led5), 
  .pos6(pos_led6), 
  .pos7(pos_led7), 
  .pos8(pos_led8), 
  .pos9(pos_led9), 
  .who(who)
 );
 // clock
 initial begin
 clock = 0;
 forever #5 clock = ~clock;
 end
 initial begin
  // Initialize Inputs
  play = 0;
  pc = 0;
  reset = 1;
  
  computer_position = 0;
  player_position = 0;

  
  #100;
  reset = 0;
  #100;
  
  play = 1;
  pc = 0;
  computer_position = 4;
  player_position = 0;
  
  #50;
  pc = 1;
  play = 0;
  #100;
  
  reset = 0;
  play = 1;
  pc = 0;
  computer_position = 8;
  player_position = 1;
  
  #50;
  pc = 1;
  play = 0;  
  #100;
  
  reset = 0;
  
  play = 1;
  pc = 0;
  computer_position = 6;
  player_position = 2;
  
  #50;
  pc = 1;
  play = 0; 
  #50
  
  pc = 0;
  play = 0;   
  end
      
endmodule
 