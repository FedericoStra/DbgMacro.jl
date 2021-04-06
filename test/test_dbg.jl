using DbgMacro

function foo()
    m = [1 2; 3 4]
    @dbg 1+2 "Hello" m
    42
end

expected_foo_err = """
Main.TestDbg:test_dbg.jl:5  1 + 2 = 3
Main.TestDbg:test_dbg.jl:5  "Hello" = "Hello"
Main.TestDbg:test_dbg.jl:5  m = [1 2; 3 4]
"""

using Suppressor: @capture_err

err = @capture_err global result = foo()
@test result == 42
@test err == expected_foo_err
