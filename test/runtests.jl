using Test
using SafeTestsets
using TestSetExtensions

@testset ExtendedTestSet "DbgMacro.jl" begin
    @safetestset Simple = "simple" begin include("simple.jl") end
end
