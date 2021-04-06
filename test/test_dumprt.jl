using DbgMacro

function foo()
    m = [1 2; 3 4]
    @dumprt asd(1 + x, :y, $z, k=v)
    42
end

expected_foo_out = """
Expr
  head: Symbol call
  args: Array{Any}((5,))
    1: Symbol asd
    2: Expr
      head: Symbol call
      args: Array{Any}((3,))
        1: Symbol +
        2: Int64 1
        3: Symbol x
    3: QuoteNode
      value: Symbol y
    4: Expr
      head: Symbol \$
      args: Array{Any}((1,))
        1: Symbol z
    5: Expr
      head: Symbol kw
      args: Array{Any}((2,))
        1: Symbol k
        2: Symbol v
"""

using Suppressor: @capture_out

out = @capture_out global result = foo()
@test result == 42
@test out == expected_foo_out
