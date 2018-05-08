LISP-primitives
booleanP: aConsCell 
	"(boolean? OBJECT)
	Return t if OBJECT is either #t or #f."
	^ self class
		test: (aConsCell car == self trueValue
				or: [aConsCell car == self falseValue])
