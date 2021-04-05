var documenterSearchIndex = {"docs":
[{"location":"","page":"Home","title":"Home","text":"CurrentModule = DbgMacro\nDocTestSetup  = quote\n    using DbgMacro\nend","category":"page"},{"location":"#DbgMacro.jl","page":"Home","title":"DbgMacro.jl","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Documentation for DbgMacro.jl.","category":"page"},{"location":"","page":"Home","title":"Home","text":"This package provides a macro @dbg. When executing","category":"page"},{"location":"","page":"Home","title":"Home","text":"@dbg ex1 ex2 ex3 ...","category":"page"},{"location":"","page":"Home","title":"Home","text":"the macro generates code that displays all the expressions in the same way as @show does, each on a separate line, preceded by the location in the format module:file:line. The output goes to stderr. Useful for debugging.","category":"page"},{"location":"","page":"Home","title":"Home","text":"It is inspired by Rust dbg! macro.","category":"page"},{"location":"#Examples","page":"Home","title":"Examples","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"using DbgMacro\n\nfunction fact(n::Integer)\n    @dbg n\n    n < 0 && error(\"`n` must be positive\")\n    n == 0 && return 1\n    n * fact(n-1)\nend\n\nfact(5)","category":"page"},{"location":"#Index","page":"Home","title":"Index","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"","category":"page"},{"location":"#Library","page":"Home","title":"Library","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Modules = [DbgMacro]","category":"page"},{"location":"#DbgMacro.@dbg-Tuple","page":"Home","title":"DbgMacro.@dbg","text":"@dbg(expressions...)\n\nDisplays all the expressions in the same way as @show does, each on a separate line, preceded by the location in the format module:file:line.\n\nThe output goes to stderr.\n\nUseful for debugging.\n\nExamples\n\njulia> m = [1 2; 3 4];\n\njulia> @dbg 1+2 \"Hello\" m\nMain:none:1  1 + 2 = 3\nMain:none:1  \"Hello\" = \"Hello\"\nMain:none:1  m = [1 2; 3 4]\n\n\n\n\n\n","category":"macro"}]
}
