# Lecture 03 : Types Part-1
- `typedef` defines a new synonym for an existing type
## Enum
- `enum` defined a new *type* with a set of scalar values with symbolic names
- Say, `typedef enum { Green, Yellow, Red} TrafficLight deriving (Bits, Eq);`, The type TrafficLight can take any value from the set of three values.
- Useful for keeping track of different state machine variables.
## Struct
- default representation : concatenation of member repr. from MSB to LSB
- use `struct.member` to access members
- Each struct type is distinct, though they may have to members with same types
## Parameterized types
- `Type #( Type, ... , Type)`
- Some parameters are numeric, indicating size of each value of that type
- `Vector#(16, Tuple2#(Bool,Bit#(8))) vect6;` -> nested type expression
- `Maybe #(t)` : an instance of tagged union type, useful to implement a ***valid bit***
  - `fromMaybe` and `isValid` can be used on this type
## Overloading
- ***deriving (Bits)***
  - Directs compiler to define `pack()` and `unpack()` for you
  - Else compiler assumes no bit representation
- ***deriving (Eq)***
  - Asks compiler to define `\==` and `!=` functions for you
  - Else compiler assumes no way to test equality
