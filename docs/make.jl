using Dbg
using Documenter

DocMeta.setdocmeta!(Dbg, :DocTestSetup, :(using Dbg); recursive=true)

makedocs(;
    modules=[Dbg],
    authors="Federico Stra <stra.federico@gmail.com> and contributors",
    repo="https://github.com/FedericoStra/Dbg.jl/blob/{commit}{path}#{line}",
    sitename="Dbg.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://FedericoStra.github.io/Dbg.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/FedericoStra/Dbg.jl",
)
