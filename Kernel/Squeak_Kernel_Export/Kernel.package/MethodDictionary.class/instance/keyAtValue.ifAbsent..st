accessing
keyAtValue: value ifAbsent: exceptionBlock
	"Answer the key whose value equals the argument, value. If there is
	none, answer the result of evaluating exceptionBlock."
	
	value ifNotNil: [
		1 to: self basicSize do: [ :index |
			(array at: index) = value ifTrue: [
				^self basicAt: index ] ] ].
	^exceptionBlock value