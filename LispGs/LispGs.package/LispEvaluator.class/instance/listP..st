LISP-primitives
listP: aConsCell 
	"(listp OBJECT)
	Return #t if OBJECT is a list."
	aConsCell
		ifNil: [self lispError: 'one argument is required'].
	aConsCell car
		ifNil: [^ self trueValue].
	^ self class
		test: (aConsCell car isConsCell
				and: [aConsCell car isList])
