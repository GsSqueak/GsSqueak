LISP-primitives
length: aConsCell 
	"(length SEQUENCE)
	Return the length of vector, list or string SEQUENCE."
	(aConsCell car isString
			or: [aConsCell car isArray])
		ifTrue: [^ aConsCell car size].
	^ (aConsCell car
		ifNil: [^ 0]) length
