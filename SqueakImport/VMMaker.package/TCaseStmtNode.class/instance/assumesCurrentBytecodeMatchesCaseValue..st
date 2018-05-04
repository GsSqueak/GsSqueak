as yet unclassified
assumesCurrentBytecodeMatchesCaseValue: statementList
	"Test for the special case of certain methods that rely on the value of
	the currentBytecode variable to be expanded to a constant. This is a
	performance optimization that permits the next bytecode to be fetched
	early while not affecting the prior value of currentBytecode, which
	will have been translated to a constant.
	
	See senders of #'requires currentBytecode to be expanded to a constant'
	for methods that rely on this behavior."

	| trickySelectors commentString firstLine |
	trickySelectors := {
			#pushLiteralConstantBytecode .
			#pushLiteralVariableBytecode .
			#pushReceiverVariableBytecode .
			#pushTemporaryVariableBytecode .
			#storeAndPopTemporaryVariableBytecode .
			#storeAndPopReceiverVariableBytecode
		}.
	firstLine := statementList statements first.
	firstLine isComment ifTrue: [
		commentString := firstLine asString.
		trickySelectors detect: [:e | commentString includesSubString: e]
			ifNone: [^ false].
		^ true].
	^ false