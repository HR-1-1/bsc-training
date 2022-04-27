# Lecture 06: Rule Scheduling
- Rule has no internal sequencing, all actions in a rule body execute atomically in a rule step
- Rule condition is a Bool expression that is purely combinational and has no side effects
## Hardware for single Rule
- Firstly all rule conditions are combinational circuits.
- And rule body contains actions which are combinational circuits
- Now for the state registers invloved, Q is feeded into the rule hadware 
- And rule output is feeded into D, and Rule condition output is feeded into EN.
## Hardware for two mutually exclusive rules
- Implement a data select between two rule action outputs
- Implement a scheduler taking two rule condition outputs as inputs.
## Manifest and Generated Circuits
- Stuff taken directly from source code :
  - State elements
  - Rule condition
  - Action Logic
- Data select logic : 
  - Inputs : candidate "next state" values from all rule bodies
  - Outputs : mux inputs into actual next state values (reg D inputs)
- Scheduler Logic :
  - Inputs : rule condition outputs
  - Outputs : ccontrol inputs of muxes in data select, and state "enables"
  - Basically combinational control logic for rules
## Datapath and Control Logic
- Datapaths and control logic are defined seperately in other HDLs
- Here Each rule specifies part of datapath and control logic
- **Complete dp** = rule dp + data select block
- **Scheduler** = rule logic + scheduler
## Rule composition
- Theoretically we can compose *any* number of rules in a single clock. But we don't do that.
- Every Rule executes entirely within one cycle
- A rule fires at most once in a cycle ( no Rule1\<Rule1)
- as many rules possible per clock cycle
- No intra-cycle communication between rules in HW
- ***Correctness*** : HW scheduler only allows rules Ri, Rj, .., Rk to execute concurrently when **net state change** is equivalent to Ri\<Rj\<...\<Rj
## Conflicts
- If two rules are enabled in a particular cycle, what prevents them from executing concurrently within a single clock cycle?
- "read/write ordering conflics" and "resource sharing conflicts"
```
rule r1 (c1);
  x <= y + 1;
endrule : r1

rule r2 (c2);
  y <= x + 2;
endrule : r2
```
- Cannot run execute these rules concurrently 
> A rule is not a Verilog "always" block!
### Resource conflict
```
rule r1(c1);
  fifo.exq(e1);
endrule : r1

rule r2 (c2);
  fifo.enq(e2);
endrule : r2
```
- FIFO has only one enq port; can't use it twice per cycle
- Bluespec HW scheduler will prevent them firing together
## Scheduler 
- Scheduler is a **purely combinational logic** that decides what *can fire* signals get to become *will fire* signals
- It computes this every clock cycle <- Dynamic scheduler
## Controlling ordering: urgency
- `(* descending_urgency = "r1, r2" *)`
- If you don't specify, compiler decides and issues a message
- Bluespec generates **deterministic hardware**.
> If you expect certain actions to go together, Put it in the same rule

