LISP-primitives
car: aConsCell 
	"(car LIST)
	Return the car (also called the head) of LIST. If LIST is nil, signal an
	error"
	aConsCell car ifNil: [self lispError: 'pair expected, got the empty list'].
	(aConsCell car isNil or: [aConsCell car isConsCell])
		ifFalse: [self lispError: 'not a cons'].
	^ aConsCell car car
