LISP-primitives
cons: aConsCell 
	"(cons CAR CDR)
	Create and return a new cons cell.
	CAR and CDR can be any object. The result will be a list if CDR is nil."
	^ ConsCell car: aConsCell car cdr: aConsCell cadr
