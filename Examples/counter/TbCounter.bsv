/*********************************************
* Title			: TbCounter.bsv
* Author		: Harish R 
* Created 		: Apr 27 2022
* Last Modified : Apr 27 2022
* Purpose		: Testbench for a basic counter using FSM
***********************************************/

import StmtFSM::*;
import myCounter::*;



(* synthesize *)
module mkTbCounter(Empty);
	Counter counter <- mkCounter();
	Reg#(Bit#(16)) state <- mkReg(0); //mkRegU, mkRegA are other options to explore

/********THE CONVENTIONAL WAY*******
	rule step0(state==0);
		counter.load(42);
		state <= 1;
	endrule

	rule step1(state==1);
		counter.increment();
		counter.decrement();
		state <= 2;
	endrule

	rule done(state==2);
		$display("TESTS FINISHED");
		$finish(0);
	endrule
*************************************/

	function check(val);
		action
			if (counter.read() != val)
			$display("FAIL: counter != %0d", val);
		endaction
	endfunction

	Stmt test_seq = seq
			counter.load(42);
			check(42);
			$display("TEST FINISHED");
		endseq;
	mkAutoFSM(test_seq);
	
endmodule
