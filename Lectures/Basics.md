# Combinational Circuits and Basic Types
## Expressions
- Variables are just names for wires in comb. ckts, not storage elements
- Expressions just describe the dataflow in a comb. circuit -> Just hardware
- Any expressions can be shared
- // : Line comment, /* ... */ : Block comment
## Types
- except `int` and `bit` other type identifiers begin with uppercase
- `Integer` -> Unbounded signed integers[For Static Elaboration Only]; `int` -> 32-bit wide signed integers.
- Strongly typed - Every variable and expression has a type
- No automatic sign- or zero-extension
- Types are independant of entities that may carry values
- Action and ActionValue : spcl types with side effects
- `let` statement to ***let*** compiler deduce the type
## Variables
- Every variable has a type
- A variable is just a name of expression
- Repeated assignment is just a notation for incrementally building up expressions
- Even for-loops are repeated hardware; Everything is static elaboration
## Functions
- Function is just an abstraction of a combinational expression
- When used for static elaboration, function arguements and results can have ***any*** type.
## Static scoping
- Scoping doesn't depend on program execution
- Mapped to nearest declaration


