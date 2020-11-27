using Dbg
using Test

@testset "Dbg.jl" begin
    # currently, this is not testing any functionality, only successful compilation
    m = [1 2; 3 4]
    @dbg 1+2 "Hello" m
end
