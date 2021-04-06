using Test
using SafeTestsets
using TestSetExtensions

@testset ExtendedTestSet "DbgMacro.jl" begin
    @safetestset TestDbg = "test_dbg" begin include("test_dbg.jl") end
    @safetestset TestDumpct = "test_dumpct" begin include("test_dumpct.jl") end
    @safetestset TestDumprt = "test_dumprt" begin include("test_dumprt.jl") end
end
