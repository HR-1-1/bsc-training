# Lecture 08: Performance Tuning using Rule Composition
- More aggressive rule composition is necessary in some situations
## RWire
- permits rule composition by enabling intra-clock communication
- 2 methods: **wset** and **wget**
- mkRWire contains no state and no logic: it's just wires
- the enable signal for **wset** is connected to valid bit of **wget**
- By testing valid bit of wget we know whether some rule containing wset is executing concurrently
## Intra-clock communication
- Say, Rj uses rw.wset() on an RWire and Rk uses rw.wget() on same RWire
- If Rj\<Rk in rule-step semantics and Rj-Rk executed concurrently in same cycle
- Then, testing *isValid(rw.wget())* allows Rk to test whether Rj is concurrent 
- Forward communication only
## Pipeline register
- `Bool canEnq = (!full || isValid(rwd.wget());`
- We can enque into a full fifo, providied we are dequeing concurrently
## BypassFIFO
- When empty, can concurrently enq and deq
- `Bool canDeq = (not empty || enab_enq);`
## Which FIFO to use?
- depends on performance requirements
- Usually ppl use PipelineFIFO
## Assertions about rule execution
- `(* attributes *)` : taken from verilog
- Two assertion attributes
  1. *fire_when_enabled* : ensures no higher urgency exists that can stall the rule
  2. *no_implicit_conditions* : ensures the condition written is sufficient for execution of the rule
