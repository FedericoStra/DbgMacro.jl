.PHONY: all
all: makedocs


.PHONY: makedocs
makedocs:
	julia --project make.jl


DOCTEST_CMD = \
using Documenter: DocMeta, doctest ;\
using DbgMacro ;\
DocMeta.setdocmeta!(DbgMacro, :DocTestSetup, :(using DbgMacro); recursive=true) ;\
doctest(DbgMacro)

.PHONY: doctest
doctest:
	julia --project -e '$(DOCTEST_CMD)'
