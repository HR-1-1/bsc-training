# Example Programs in BSV
## Points to Note
- The compiler will object if the name of the package is not the same as the file it is stored in.
- Actions within a rule execute simultaneously in hardware; 
- But System tasks within a rule are performed by a simulator in the order they are written
- To execute multiple statements in a single clock cycle in Stmt, Use `action ... endaction` block
- `<-` Used for stuff that performs side-effects
- `=` no side-effects
> **Wire**: Write before read
> **Register**: read before write
- Registers get swapped via Parellel composistion: 
```
x1 <= y1;
y1 <= x1;
```

