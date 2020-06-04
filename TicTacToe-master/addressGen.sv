module addressGen(input [9:0] pixelx, pixely,
										posx, posy,
						output xm63, ym63,
						output logic [11:0] address);
logic [9:0] idx, idy;
assign idx= pixelx-posx;
assign idy= pixely-posy;

assign address={idy[5:0], idx[5:0]};

assign xm63= (idx > 10'd63);
assign ym63= (idy > 10'd63);
endmodule
