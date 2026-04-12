An example showing how to use `mkArbiter` from the standard `Arbiter` library
in Bluespec Haskell (`.bs`).

This example instantiates a 3-client round-robin arbiter:

- each client requests service every cycle
- `mkArbiter False` rotates priority after each grant
- the simulation prints the current `grant_id` and per-client grant bits

You should see the grant rotate across clients `0`, `1`, and `2`.

The relevant library API is:

- `mkArbiter :: Bool -> Module (Arbiter_IFC count)`
- `Arbiter_IFC` exposes `clients :: Vector count ArbiterClient_IFC`
- each client supports `request :: Action` and `grant :: Bool`

In this `.bs` example, individual clients are selected with:

```haskell
let c0 = arb.clients !! 0
```

That `!!` indexing comes from the `Vector` package.

# Bluesim
```bash
make b_compile b_link b_sim
```
