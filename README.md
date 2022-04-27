## Learning BSV
- Hey there!!
## Using Tools
- `bsc` gives verilog 95 code
- Flow : Preprocessing -> Parse -> Type check -> Elaboration -> Scheduler -> Verilog/ sim generation
- Error messages
  1. P: parse error- incorrect syntax
  2. T: type checking error
  3. G: generation error 
- Command line options
  1. -v verbosity
  2. -verilog/ -sim
  3. setting op dir: -bdir -cdir -vdir
  4. recompiles imported modules if needed: -u
  5. generates cross reference file: -cross-info
  6. keep scheduling signals: -can-fires
  7. -e foo : causes verilog module to be created for *foo*
- Other Command line options
  1. -m n : run simulator for n clock cycles
  2. -V vcdfile : dump to vcd file
  3. -r : shows which rules fire at each step
  4. -show-schedule : shows schedule
---
## Doubts
- [ ] Cannot index into a Reg#(int) using `[]`, Compiler throws up error
- [x]   ```
    rule r1 (c1);
      x <= y + 1;
    endrule : r1

    rule r2 (c2);
      y <= x + 2;
    endrule : r2
    ```
    If *c1* and *c2* are both true, Which rule will execute? 
- [ ] Difference between nesting put and get as interfaces instead of defining them as methods
---
## More resources
- support@bluespec.com
- 
