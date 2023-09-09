repl:
	cabal repl lib:icfp2023-inference-tricks
.PHONY: repl

lib:
	cabal build icfp2023-inference-tricks
.PHONY: lib

prep:
	cabal clean
	cabal build icfp2023-inference-tricks
.PHONY: prep

no-inference:
	cabal build lib:no-inference
.PHONY: no-inference

fundep:
	cabal build lib:fundep
.PHONY: fundep

effects:
	cabal build lib:effects
.PHONY: effects

explicit:
	cabal build lib:explicit
.PHONY: explicit

the-proof:
	cabal build lib:the-proof
.PHONY: the-proof

imp-proof:
	cabal build lib:imp-proof
.PHONY: imp-proof
