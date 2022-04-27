# Lecture 01 : Introduction
Prerequisites:
- Some RTL coding and verification knowledge
- Exposure to microarchitectures
## A good HDL
- "The verification problem is a design problem"
- Must accomodate robust changes
- Abstraction with HW Quality
- Describes HW naturally
## Gen stuff
- interface : Interface decoration for interface between test bench and HW decription.
- If a register is changed under two processes, the code is not synthesizable.
- Verification of Concurrency and shared resources is greatly simplified in ```urgency```.
## Parameterization
- You can pass a module as a parameter to another module
- Recursives are possible
- Can parameterize functions
- All of BSV is synthesizable
## BSV Vs RTL & SystemC
- Rules are guarded atomic state transitions.
- Synchronization in implicit in atomic semantics.
- Sequential behaviours are built by composing rules.
- BSV is operation-centric whereas RTL and systemC are simulation-centric.
  - Sensitivity lists are merely simulation concerns.
- Critical difference between function and algorithm
  - A function : spec of I/O behaviour
  - An algorithm : a specific implementation with a particular cost model
- Hence sequential specs (eg., C/C++) are good for functionality not for algorithms
- BSV gives precise control over micro-architecture but automates complex concurrency and control
- No central datapath description
- *Rule semantics* seperates Functional correctness and performance correctness
