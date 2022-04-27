# Lecture 05 : Rules
- All behaviour in BSV is expressed using *Rules* , Similar to an *always* block
- A rule is a Declarative specification of a state transition
## Rule Condition
- Boolean expression that is purely combinational
## Rule Action
- `<=` : Non blocking assignment, Eg: r <= expr
- Rule body can contain multiple actions. 
- ***No sequencing of actions*** in rule body. All actions occur parallely
### Conflicts in Rule action
1. **Parallel Composablility** : Meaningless to put confilicting actions in same rule
2. **Resource conflicts** : Like trying to read two diff registers in register file using a single read-port
## Rule Untimed Semantics
- Given a set of rules and an initial state; while :
  - choose one applicable rule (non-deterministic)
  - apply it to produce the next state
- **Step** : Execution of a step
> Rules are atomic, A Rule step is an atomic state change
## 2-stage Processor Pipeline
- The order of execution doesn't matter when the rules are atomic and thinking one-rule at-a-time.
- Precisely, this kind of equivalence allows the Bluespec Compiler to **schedule** rules to execute concurrently in while preserving **functional correctness**.
- In future, If we wish to make this a 3-stage Pipeline (split the fetch and decode) -> ***Rules Transformations***
## Implicit Conditions in Methods
- We can fold conditions inside methods implicitly
- Enables us to write without testing it explicity (compiler inserts it).

 
