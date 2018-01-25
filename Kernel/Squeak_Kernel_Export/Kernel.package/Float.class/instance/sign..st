mathematical functions
sign: aNumber
	"Return a Number with the same sign as aNumber and same magnitude as self.
	Implementation is different from super to handle the special case of Float negativeZero."

	(self = 0.0 and: [aNumber sign negative]) ifTrue: [^Float negativeZero].
	^aNumber copySignTo: self