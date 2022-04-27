# Lecture 04 : Module Hierarchy
- Modules can *instantiate* other modules, resulting in a module hierarchy.
## Interfaces
- Interfaces are structured into *methods*. 
- A module *provides* an interface and It's external environment *uses* it.
- Interfaces are **types**, like structs containing methods
- `typedef FIFO#(EtherPacket) InPackets;` - Emphasizing Interfaces are types
- An action method and a value are just a part of a rule
## Instantation
- `BusInterface bifc2 <- mkM;` 
- BSV Shorthand for instantiating an interface and binding it to the interface provided by a module
## Registers
- All registers are modules, instantiated explicitly
- `mkReg()` module instantiates a register with a given reset value.
  - `Reg#(Int#(16)) <- mkReg(0);`
> Precise control over Microarchitecture is a power
## Synthesis boundaries and inlining
- `\(\* synthesize \*\)` attribute at the top of a module prevents inlining in generated verilog
- 

