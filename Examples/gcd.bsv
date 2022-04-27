module mkGCD (Empty);
	
	int a=60, b=10;
	Reg#(int)	x <- mkReg(a);
	Reg#(int)	y <- mkReg(b);

	rule decr ( x<=y && y!=0 );
		y <= y-x;
	endrule : decr

	rule swap ( x>y && y!=0 );
		x <= y; y <= x;
	endrule : swap
	
	rule answer ( y==0 );
		$display("The GCD of %d and %d is %d", a, b, x);
		$finish;
	endrule : answer
endmodule
