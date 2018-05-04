converting
asExpression

	^ (self statements size = 1)
		ifTrue: [statements first]
		ifFalse: [self error: 'multiple statements can not serve as a simple expression']