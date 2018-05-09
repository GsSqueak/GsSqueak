LISP-primitives
stringP: aConsCell 
	"(stringp OBJECT)
	Return t if OBJECT is a String."
	^ self class
		test: (aConsCell car isString
				and: [aConsCell car isSymbol not])
