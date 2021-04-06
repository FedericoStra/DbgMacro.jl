module DbgMacro

export @dbg, @dumpct, @dumprt, @qn

"""
    @dbg <expr1> <expr2> <expr3> ...

Display all the expressions in the same way as `@show` does, each on a separate line,
preceded by the location in the format `module:file:line`.

The output goes to `stderr`.

Useful for debugging.

# Examples

```jldoctest
julia> m = [1 2; 3 4];

julia> @dbg 1+2 "Hello" m
Main:none:1  1 + 2 = 3
Main:none:1  "Hello" = "Hello"
Main:none:1  m = [1 2; 3 4]
```
"""
macro dbg(exprs...)
    mod = __module__
    file = relpath(string(__source__.file))
    line = __source__.line
    location = "$mod:$file:$line  "
    esc(quote
        $((:(Base.println(Base.stderr, $location,
            $(ex isa String ? repr(ex) : string(ex)),
            " = ", Base.repr($ex))) for ex in exprs)...)
    end)
end

export @dumpct, @dumprt

"""
    @dumpct <expression>

Dump the expression at compile-time.

# Examples

```jldoctest
julia> function foo(x)
           @dumpct :x + x + \$x
           x
       end
Expr
  head: Symbol call
  args: Array{Any}((4,))
    1: Symbol +
    2: QuoteNode
      value: Symbol x
    3: Symbol x
    4: Expr
      head: Symbol \$
      args: Array{Any}((1,))
        1: Symbol x
foo (generic function with 1 method)

julia> foo(42)
42
```
"""
macro dumpct(ex)
    dump(ex; maxdepth=32)
end

"""
    @dumprt <expression>

Dump the expression at run-time.

# Examples

```jldoctest
julia> function foo(x)
           @dumprt :x + x + \$x
           x
       end
foo (generic function with 1 method)

julia> foo(42)
Expr
  head: Symbol call
  args: Array{Any}((4,))
    1: Symbol +
    2: QuoteNode
      value: Symbol x
    3: Symbol x
    4: Expr
      head: Symbol \$
      args: Array{Any}((1,))
        1: Symbol x
42
```
"""
macro dumprt(ex)
    :(dump($(QuoteNode(ex)); maxdepth=32))
end

"""
    @qn <expression>

Return the expression, without \$ interpolation.

# Examples

```jldoctest
julia> @qn foo(1, x, :y, \$z)
:(foo(1, x, :y, \$(Expr(:\$, :z))))
```
"""
macro qn(ex)
    QuoteNode(ex)
end

end
