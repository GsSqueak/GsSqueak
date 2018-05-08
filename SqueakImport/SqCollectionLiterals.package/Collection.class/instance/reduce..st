enumerating
reduce: binaryBlock
	"Apply the argument, binaryBlock cumulatively to the elements of the receiver.
	For sequenceable collections the elements will be used in order, for unordered
	collections the order is unspecified."

	| first nextValue |
	first := true.
	self do: [ :each |
		first
			ifTrue: [ nextValue := each. first := false ]
			ifFalse: [ nextValue := binaryBlock value: nextValue value: each ] ].
	first ifTrue: [ self errorEmptyCollection ].
	^nextValue
