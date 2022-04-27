/******************************************************
* Title			: mult_v2.bsv
* Author		: Harish R EE20B044
* Created 		: Apr 25 2022
* Last Modified	: Apr 25 2022
* Purpose		: Modularized version of a simple multiplier
*******************************************************/

interface Mult_ifc;
	method Action start (Bit#(32) x, Bit#(32) y);
	method Bit#(32) result ();
endinterface: Mult_ifc

module mkMult1 (Mult_ifc);
	Reg#(Bit#(32)) product	<-	mkReg(0);
	Reg#(Bit#(32)) d			<-	mkReg(0);
	Reg#(Bit#(32)) r	<-	mkReg(0);

	rule cycle (r!=0);
		if (r[0] == 1) product <= product + d;
		d <= d<<1;
		r <= r>>1;
	endrule

	method Action start (x,y) if (r==0);
		d <= x;
		r <= y;
	endmethod

	method Bit#(32) result () if (r==0);
		return product;
	endmethod

endmodule: mkMult1

module mkTestbench (Empty);
	Reg#(Bit#(32)) state	<-	mkReg(0);
	Mult_ifc m 	<-	mkMult1();

	rule go (state == 0);
		m.start(9, 5);
		state <= 1;
	endrule

	rule finish (state == 1);
		$display ("Product = d", m.result());
		state <= 2;
	endrule

endmodule: mkTestbench

