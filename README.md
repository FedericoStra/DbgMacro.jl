# DbgMacro.jl

<!-- ![Lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg) -->
![Lifecycle](https://img.shields.io/badge/lifecycle-maturing-blue.svg)<!--
![Lifecycle](https://img.shields.io/badge/lifecycle-stable-green.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-retired-orange.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-archived-red.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-dormant-blue.svg) -->
[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://FedericoStra.github.io/DbgMacro.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://FedericoStra.github.io/DbgMacro.jl/dev)
[![Build Status](https://github.com/FedericoStra/DbgMacro.jl/workflows/CI/badge.svg)](https://github.com/FedericoStra/DbgMacro.jl/actions)
[![Code Style: Blue](https://img.shields.io/badge/code%20style-blue-4495d1.svg)](https://github.com/invenia/BlueStyle)
[![ColPrac: Contributor's Guide on Collaborative Practices for Community Packages](https://img.shields.io/badge/ColPrac-Contributor's%20Guide-blueviolet)](https://github.com/SciML/ColPrac)

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

```julia
julia> using DbgMacro

julia> m = [1 2; 3 4]
2×2 Matrix{Int64}:
 1  2
 3  4

julia> @dbg 1+2 "Hello" m
Main:REPL[3]:1  1 + 2 = 3
Main:REPL[3]:1  "Hello" = "Hello"
Main:REPL[3]:1  m = [1 2; 3 4]
```
