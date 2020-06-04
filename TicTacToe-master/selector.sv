module selector (
	input btn_selector,
	input reset,
	output Xp, Op
);
	logic X = 1'b1;
	logic O = 1'b0;
	assign Xp = X;
	assign Op = O;
	always@(posedge btn_selector, posedge reset)
	begin
		if(reset)
		begin
			X = 1'b1;
			O = 1'b0;
		end
		else
		begin
			X <= ~X;
			O <= ~O;
		end
	end
endmodule 