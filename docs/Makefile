.PHONY: all
all: makedocs


.PHONY: makedocs
makedocs: setup-project
	julia --project make.jl


DOCTEST_CMD = \
using Documenter: DocMeta, doctest ;\
using DbgMacro ;\
DocMeta.setdocmeta!(DbgMacro, :DocTestSetup, :(using DbgMacro); recursive=true) ;\
doctest(DbgMacro)

.PHONY: doctest
doctest: setup-project
	julia --project -e '$(DOCTEST_CMD)'


SETUP_PROJECT_CMD = \
using Pkg ;\
Pkg.develop(path="..") ;\
Pkg.instantiate()

.PHONY: setup-project
setup-project:
	julia --project -e '$(SETUP_PROJECT_CMD)'
