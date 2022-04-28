package Testbench;

import LSFR :: *;
import Vector :: *;

import Utils :: *;
import Bubblesort :: *;

typedef 20 N_t;

Int #(32) n = fromInteger(valueOf (N_t));

(* synthesize *)
module mkBubble
