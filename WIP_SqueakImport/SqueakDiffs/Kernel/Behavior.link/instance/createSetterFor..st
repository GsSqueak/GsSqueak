*Tools-Browser-accessors
createSetterFor: aName

	| code |
	code := '{1}: anObject\	\	{2}{1} := anObject.\' withCRs
		format: {aName. self settersReturnValue ifTrue: ['^ '] ifFalse: [''].}.
	self compile: code classified: #accessing notifying: nil.