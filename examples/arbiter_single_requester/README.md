An example showing that with a 3-client `mkArbiter False`, if only client `2`
ever requests, then client `2` is always granted.

The test drives only:

```haskell
c2.request
```

and checks every cycle that:

- `grant_id == 2`
- client `0` grant is low
- client `1` grant is low
- client `2` grant is high

# Bluesim
```bash
make b_compile b_link b_sim
```
