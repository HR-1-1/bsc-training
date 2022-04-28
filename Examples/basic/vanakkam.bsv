/*********************************************
* Title			: vanakkam.bsv
* Author		: Harish R 
* Created 		: Apr 27 2022
* Last Modified : Apr 27 2022
* Purpose		: To start writing real bluespec
***********************************************/

package vanakkam;
	
	String s = "Deep Thought says: Vanakkam, Universe! The answer is 42.";

	(* synthesize *)
	module mkTestbench (Empty);
		
		Reg#(UInt#(3)) ctr <- mkReg(0);

		
		rule rl_print_answer;
			ctr <= ctr+1;
			$display(s);
			if (ctr==4) $finish(0);
		endrule
	endmodule
endpackage
