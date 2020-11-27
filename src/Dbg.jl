module Dbg

export @dbg

"""
    @dbg(expressions...)

Displays all the expressions in the same way as `@show` does, each on a separate line,
preceded by the location in the format `module:file:line`.

The output goes to `stderr`.

Useful for debugging.

# Examples
```jldoctest
julia> m = [1 2; 3 4]
julia> @dbg 1+2 "Hello" m
Main:REPL[14]:1  1 + 2 = 3
Main:REPL[14]:1  "Hello" = "Hello"
Main:REPL[14]:1  m = [1 2; 3 4]
```
"""
macro dbg(exprs...)
    mod = __module__
    file = relpath(string(__source__.file))
    line = __source__.line
    location = "$mod:$file:$line  "
    esc(quote
        $((:(Base.println(Base.stderr, $location,
            $(ex isa Symbol || ex isa Expr ? string(ex) : repr(ex)),
            " = ", Base.repr($ex))) for ex in exprs)...)
    end)
end

end
