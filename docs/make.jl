using DbgMacro
using Documenter

DocMeta.setdocmeta!(DbgMacro, :DocTestSetup, :(using DbgMacro); recursive=true)

makedocs(;
    modules=[DbgMacro],
    authors="Federico Stra <stra.federico@gmail.com> and contributors",
    repo="https://github.com/FedericoStra/DbgMacro.jl/blob/{commit}{path}#{line}",
    sitename="DbgMacro.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://FedericoStra.github.io/DbgMacro.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/FedericoStra/DbgMacro.jl",
)
