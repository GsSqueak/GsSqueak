contexts
popInteger
"returns 0 if the stackTop was not an integer value, plus sets primFailCode"
	| integerPointer |
	integerPointer := self popStack.
	^self checkedIntegerValueOf: integerPointer