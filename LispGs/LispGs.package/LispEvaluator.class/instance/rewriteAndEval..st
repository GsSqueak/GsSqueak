entry points
rewriteAndEval: anObject
  "lisp primitives should use this methods instead of #top: which is
	always considered as the topmost context of a Lisp interpreter."

  ^ self eval: (ConsCell car: (self class rewrite: anObject asCons))