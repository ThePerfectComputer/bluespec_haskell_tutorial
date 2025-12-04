A simple intro example that shows how to use type level logarithm and
inspect the computed value at compile time.
increments a cycle counter and also prints out "Hello World."


# Running
```bash
make b_compile
```

You should see the following message amongst the compiler output:
```
Compilation message: "src/Top.bs", line 11, column 45:  valueOf (TLog TestVal) 4.0
```
