evaluating
value
	"Evaluate the elements of the receiver and answer the result of last evaluation."

	^self inject: nil into:
		[:previousAnswer :each | each value]