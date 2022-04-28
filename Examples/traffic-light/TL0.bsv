/*********************************************
* Title			: TL0.bsv
* Author		: Harish R 
* Created 		: Apr 28 2022
* Last Modified : Apr 28 2022
* Purpose		: A Simple model of a traffic light - Version 0
***********************************************/
package TL0;

	interface TL;
	endinterface: TL

	typedef enum{
		G_NS, A_NS, R_NS,
		G_E, A_E, R_E,
		G_W, A_W, R_W} TLStates deriving (Eq, Bits);

	(* synthesize *)
	module sysTL(TL);
		Reg#(TLStates) state <- mkReg(R_W);


endpackage: TL0
