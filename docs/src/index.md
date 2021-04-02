```@meta
CurrentModule = DbgMacro
DocTestSetup  = quote
    using DbgMacro
end
```

# DbgMacro.jl

Documentation for [DbgMacro.jl](https://github.com/FedericoStra/DbgMacro.jl).

This package provides a macro `@dbg`. When executing

```julia
@dbg ex1 ex2 ex3 ...
```

the macro generates code that displays all the expressions in the same way as `@show` does, each on a separate line,
preceded by the location in the format `module:file:line`. The output goes to `stderr`. Useful for debugging.

It is inspired by Rust [`dbg!`](https://doc.rust-lang.org/std/macro.dbg.html) macro.

## Examples

```@repl
using DbgMacro

function fact(n::Integer)
    @dbg n
    n < 0 && error("`n` must be positive")
    n == 0 && return 1
    n * fact(n-1)
end

fact(5)
```

## Index

```@index
```

## Library

```@autodocs
Modules = [DbgMacro]
```
