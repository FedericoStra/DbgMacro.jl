# Dbg.jl

This package provides a macro `@dbg`. When executing

```julia
@dbg ex1 ex2 ex3 ...
```

the macro generates code that displays all the expressions in the same way as `@show` does, each on a separate line,
preceded by the location in the format `module:file:line`. The output goes to `stderr`. Useful for debugging.

It is inspired by Rust [`dbg!`](https://doc.rust-lang.org/std/macro.dbg.html) macro.

# Examples

```julia
julia> m = [1 2; 3 4]
julia> @dbg 1+2 "Hello" m
Main:REPL[14]:1  1 + 2 = 3
Main:REPL[14]:1  "Hello" = "Hello"
Main:REPL[14]:1  m = [1 2; 3 4]
```
