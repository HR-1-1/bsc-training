/*********************************************
* Title			: Counter.bsv
* Author		: Harish R 
* Created 		: Apr 27 2022
* Last Modified : Apr 27 2022
* Purpose		: Implement a basic counter
***********************************************/

interface Counter;
	method Bit#(8) read();
	method Action load(Bit#(8) newval);
	method Action increment();
	method Action decrement();
endinterface

(* synthesize *) //To avoid inlining
module mkCounter (Counter);
	Reg#(Bit#(8)) value <- mkReg(0);
	PulseWire pw_inc <- mkPulseWire();
	PulseWire pw_dec <- mkPulseWire();

	rule update_counter ( pw_inc || pw_dec );
		if(pw_inc && !pw_dec)
			value <= value + 1;
		else if(!pw_inc && pw_dec)
			value <= value - 1;
	endrule

	method Bit#(8) read();
		return value;
	endmethod

	method Action load(Bit#(8) newval);
		value <= newval;
	endmethod

	method Action increment();
		pw_inc.send();
	endmethod
	
	method Action decrement();
		pw_dec.send();
	endmethod
endmodule
