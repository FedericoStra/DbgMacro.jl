module DbgMacro

export @dbg, @dumpct, @dumprt

"""
    @dbg(expressions...)

Displays all the expressions in the same way as `@show` does, each on a separate line,
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
"""
macro dumpct(ex)
    dump(ex; maxdepth=32)
end

"""
    @dumpct <expression>

Dump the expression at run-time.
"""
macro dumprt(ex)
    :(dump($(QuoteNode(ex)); maxdepth=32))
end

end
