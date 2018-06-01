expression types
expression
	(hereType == #word
			and: [tokenType == #leftArrow])
		ifTrue: [^ self assignment: self variable].
	self primaryExpression
		ifFalse: [^ false].
	((self messagePart: 3 repeat: true)
			and: [hereType == #semicolon])
		ifTrue: [self cascade].
	^ true