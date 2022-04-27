# Lecture 09: More on Module Interfaces
> Different Modules can implement the same interfaces differently.
## Packages
- BSV Libraries are organized in packages
- `import Foo :: *;`
- Now can use typedefs, interfaces defined in *Foo*
## Library Conventions
- Module names typically begin with *mk*
- Types (and Interfaces obv) begin with an uppercase letter
- Functions and other identifiers begin with a lowercase letter
- Standard Prelude package is automatically imported
---
## Abstracted Interfaces
- Absolutely no HW overhead
- Can go from Get/Put to Client/Server
## Nested Interfaces
```
interface CacheIfc;
  interface Put#(Req_t) p2c_request;
  interface Get#(Resp_t) c2p_response;
endinterface
```
- `fifoToPut(p2c);` `fifoToGet(c2p);` -> High Level functions 
## Connectables
- ```
  typeclass Connectable#(type t1, type t2);
    module mkConnection(t1 m1, t2 m2, Empty i);
  endtypeclass
  ```
- an overloaded module **mkConnection** which encapsulates connection details between duals like get/put
## Lowering Abstraction level
- In real world, need to interact with Non-BSV environment sometime
- Can expose implicit conditions as Bool method
- remove enable and ready signal by using always_enable, always_ready
- Ungaurded FIFOs 
## Input driving with zero latency
- 
