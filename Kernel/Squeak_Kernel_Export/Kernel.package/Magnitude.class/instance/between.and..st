comparing
between: min and: max 
	"Answer whether the receiver is less than or equal to the argument, max, 
	and greater than or equal to the argument, min."

	min <= self ifFalse: [ ^false ].
	^self <= max