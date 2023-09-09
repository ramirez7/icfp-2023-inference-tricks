lib:
	cabal build icfp2023-inference-tricks
.PHONY: lib

no-inference:
	cabal build lib:no-inference
.PHONY: no-inference

explicit:
	cabal build lib:explicit
.PHONY: explicit

the-proof:
	cabal build lib:the-proof
.PHONY: the-proof

imp-proof:
	cabal build lib:imp-proof
.PHONY: imp-proof
