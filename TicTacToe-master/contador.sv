//-----------------------------------
//-- Entrada: señal de reloj
//-- Salida: contador de 26 bits
//-----------------------------------
module contador(input clk, output logic [3:0] data);
    
//-- La salida es un registro de 26 bits, inicializado a 0
logic [3:0] temp = 4'b0000 ;
    
//-- Sensible al flanco de subida
always @(posedge clk) begin
  //-- Incrementar el registro
  
  begin
  if (temp==4'b1000)
    temp <= 4'b0000;
  else
    temp <= temp + 1;
  end
 end
 
assign data = temp;

endmodule 