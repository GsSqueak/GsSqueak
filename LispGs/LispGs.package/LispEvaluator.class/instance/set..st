LISP-primitives
set: aConsCell 
	"(set SYMBOL NEWVAL)
	Set SYMBOL's value to NEWVAL, and return NEWVAL.
	-- you should not use this special form in Scheme --"
	| form |
	form := aConsCell listCopy.
	form setcar: (self evalObject: form car).
	^ self setD: form
