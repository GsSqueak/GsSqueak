LISP-primitives
LISPand: aConsCell 
	"(and &rest CONDITIONS)
	Eval CONDITIONS until one of them yields nil, then return nil.
	The remaining conditions are not evaluated at all.
	If no condition yields nil, return the last arg's value."
	| val |
	(aConsCell
		ifNil: [^ self trueValue])
		doWithCdr: [:form :cdr | 
			val := cdr
						ifNil: [self evalTailObject: form]
						ifNotNil: [self evalObject: form].
			val asOneLispValue == self falseValue
				ifTrue: [^ self falseValue]].
	^ val
