LISP-primitives
nullP: aConsCell 
	"(null? OBJECT)
	Return #t if OBJECT is nil."
	^ self class test: aConsCell car isNil
