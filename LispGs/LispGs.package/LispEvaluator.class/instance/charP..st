LISP-primitives
charP: aConsCell 
	"(char? OBJECT)
	Return #t if OBJECT is a character."
	^ self class test: aConsCell car isCharacter
