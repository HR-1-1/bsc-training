/*********************************************
* Title			: Bubblesort.bsv
* Author		: Harish R 
* Created 		: Apr 28 2022
* Last Modified : Apr 28 2022
* Purpose		: A parallel bubble-sorter
***********************************************/

package Bubblesort;

import Vector :: *;
import Utils :: *;

interface Sort_IFC #(numeric type n_t);
	method Action put (Int #(32) x);
	method ActionValue #(Int #(32)) get;
endinterface

(* synthesize *)
module mkBubblesort (Sort_IFC #(n_t));
	
	Integer n = valueOf (n_t);
	Integer jMax = n-1;

	Reg #(UInt #(16)) rg_inj <- mkReg(0);
	Vector #(n_t, Reg #(Int #(32)) xs <- replicateM (mkReg (maxBound));

	for (Integer i = 0; i < n-1; i = i+1)
		rule rl_swap_i (xs [i] > xs [i+1]);
			xs[i] <= xs[i+1];
			xs[i+1] <= xs[i];
		endrule
	
	function Bool done ();
		Bool b = (rg_inj == fromInteger(n));
		for (Integer i = 0; i < n-1; i=i+1)
			b = b && (xs[i] <= xs[i+1]);
		return b;
	endfunction

	method Action put (Int #(32) x) if ((rg_inj < fromInteger(n)) && xs[jMax] == maxBound);
		xs[jMax] <= x;
		rg_inj <= rj_inj + 1;
	endmethod

	method ActionValue #(Int #(32)) get () if (done);
		writeVReg (xs, shiftInAtN (readVReg (xs), maxBound));
		if (xs[1] == maxBound) rg_inj <= 0; //Reading happens before you have written to the register
		return xs[0];
	endmethod
endmodule: mkBubblesort

endpackage: Bubblesort








