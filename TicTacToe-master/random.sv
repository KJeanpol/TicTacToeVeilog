module random;

  bit[3:0] vec;

  initial begin
    assert(std::randomize(vec));
    $display("vec = %070b", vec);
	 assert(std::randomize(vec));
    $display("vec = %070b", vec);
  end

endmodule