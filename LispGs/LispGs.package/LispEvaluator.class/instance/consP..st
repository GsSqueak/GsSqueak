LISP-primitives
consP: aConsCell 
	"(consp OBJECT)
	Return t if OBJECT is a cons cell"
	^ self class test: aConsCell car isConsCell
