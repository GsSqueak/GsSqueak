LISP-primitives
not: aConsCell 
	"(not OBJECT)
	Return t if OBJECT is false."
	^ self class test: aConsCell car == self falseValue
