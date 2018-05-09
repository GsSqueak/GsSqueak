LISP-primitives
cdr: aConsCell 
	"(cdr LIST)
	Return the cdr (also called the tail) of LIST. If LIST is nil, signal an
	error"
	aConsCell car ifNil: [self lispError: 'pair expected, got the empty list'].
	^ aConsCell car cdr
