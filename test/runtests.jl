using Test
using Suppressor

using Dbg

function foo()
    m = [1 2; 3 4]
    @dbg 1+2 "Hello" m
    42
end

expected_foo_err = """
Main:runtests.jl:8  1 + 2 = 3
Main:runtests.jl:8  "Hello" = "Hello"
Main:runtests.jl:8  m = [1 2; 3 4]
"""

@testset "Dbg.jl" begin
    local result
    err = @capture_err result = foo()
    @test result == 42
    @test err == expected_foo_err
end
