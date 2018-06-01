evaluating
valueWithArguments: anArray
	"Evaluate the elements of the receiver with provided arguments and answer the result of last evaluation."

	^self inject: nil into:
		[:previousAnswer :each | each valueWithArguments: anArray]