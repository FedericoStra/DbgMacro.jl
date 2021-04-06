```@meta
CurrentModule = DbgMacro
DocTestSetup  = quote
    using DbgMacro
end
```

# DbgMacro.jl

Documentation for [DbgMacro.jl](https://github.com/FedericoStra/DbgMacro.jl).

This package provides four macros: `@dbg`, `@dumpct`, `@dumprt` and `@qn`.

When executing

```julia
@dbg ex1 ex2 ex3 ...
```

the macro generates code that displays all the expressions in the same way as `@show` does, each on a separate line,
preceded by the location in the format `module:file:line`. The output goes to `stderr`. Useful for debugging.

It is inspired by Rust [`dbg!`](https://doc.rust-lang.org/std/macro.dbg.html) macro.

The macros `@dumpct` and `@dumprt`

```julia
@dumpct expression
@dumprt expression
```

dump the provided expression at compile-time or run-time respectively.

The macro `@qn`

```julia
@qn expression
```

returns the quoted expression without interpolating contained `$`.

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

function ct(x)
    @dumpct :x + x + $x
    x
end

ct(42)

function rt(x)
    @dumprt :x + x + $x
    x
end

rt(42)

@qn :x + x + $x
```

## Index

```@index
```

## Library

```@autodocs
Modules = [DbgMacro]
```
