LISP-primitives
symbolP: aConsCell 
	"(symbolp OBJECT)
	Return t if OBJECT is a Symbol."
	^ self class test: aConsCell car isSymbol
