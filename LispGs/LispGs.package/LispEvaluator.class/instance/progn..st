LISP-primitves
progn: aConsCell 
	"(progn &rest BODY)
	Eval BODY forms sequentially and return value of last one."
	| v |
	aConsCell
		ifNil: [^ nil].
	aConsCell
		doWithCdr: [:form :cdr | cdr
				ifNil: [v := self evalTailObject: form]
				ifNotNil: [self evalObject: form]].
	^ v
