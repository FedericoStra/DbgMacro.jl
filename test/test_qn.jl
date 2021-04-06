using DbgMacro

@test (@qn foo(1, x, :y, $z)) == :(foo(1, x, :y, $(Expr(:$, :z))))
