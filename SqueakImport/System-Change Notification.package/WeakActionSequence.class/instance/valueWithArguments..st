evaluating
valueWithArguments: anArray
	"Return the last result"

	^self inject: nil into: [ :previousAnswer :each |
		each valueWithArguments: anArray otherwise: [ previousAnswer ]]