LISP-primitives
LISPor: aConsCell 
	"(or &rest CONDITIONS)
	Eval CONDITIONS until one of them yields non-nil, then return that
	value. The remaining args are not evaluated at all.
	If all args return nil, return nil."
	| val |
	(aConsCell
		ifNil: [^ self falseValue])
		doWithCdr: [:form :cdr | 
			val := cdr
						ifNil: [self evalTailObject: form]
						ifNotNil: [self evalObject: form multipleValue: true].
			val asOneLispValue == self falseValue
				ifFalse: [^ val]].
	^ self falseValue
