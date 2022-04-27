module mkTestbench (Empty);

	rule rl_print_answer;
		$display ("Deep Thought says: Vanakkam, Universe! The answer is 42.");
		$finish;
	endrule
endmodule
