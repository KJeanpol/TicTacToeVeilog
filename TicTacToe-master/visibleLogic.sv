module visibleLogic(	input xm63, ym63,
							input [2:0] color,
							output logic visible);
							
logic background;
assign backgound = (color== 3'd0);

assign visible = ~background && ~(xm63|ym63); //visible =0 se tiene que ver en pantalla

endmodule 