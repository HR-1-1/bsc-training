# Lecture 07: Modularizing behaviour (Rules) with Interface Methods
- Interfaces are types and Methods ARE just hardware
- Methods and Interfaces are how module communicate with the outside world
- Think of Calling methods are connecting wires in hardware
## Interface
- An interface declaration can contain one or more method declarations (even nested interfaces)
- Predefined interface : `Empty` : No methods
## Methods
- A method describes certain behaviour, and the conditions for that behaviour
- Each method has an associated READY signal (o/p) - implicit condition
- Methods which perform an action have an associated ENABLE signal (i/p)
- Method arguments: i/p
- Method results: o/p
## 3 Kinds of methods
### Value methods
- Purely Combinational
- Takes 0 or more arguements and return a value
- Eg: `FIFO.first()`
- Can be used in expressions
### Action methods
- Takes 0 or more arguments and performs an action (side-effect) inside the module
- Can be used in Action contexts (like rule body)
- Eg: `FIFO.deq()`
### ActionValue methods
- Combines Action and Value methods
- Eg: `FIFO.pop()`
- Can't be used in rule conditions(since have side effects)
- Use the special assignment `<-`
## Interface method definition
- Must be written at the end of module body
## Sharing methods
- A BSV method represents real hardware, so there is only one instance per instantiated module
- Since it's a shared resource, Parallel accesses must be scheduled
- Data inputs/outputs need to be muxed/distributed
- BSV compiler does this for you
- Value methods with no arguments need no muxing - just fan-out
- BSV primitives can specify a replication factor for having replicas of the *same method*
## Transaction Level Modelling
- Method: a transaction that can be applied against a module
- allows us to move easily between high-level abstraction and actual hardware implementation 
