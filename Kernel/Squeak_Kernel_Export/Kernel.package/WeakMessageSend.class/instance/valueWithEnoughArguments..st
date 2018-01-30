evaluating
valueWithEnoughArguments: anArray
	"call the selector with enough arguments from arguments and anArray"
	^self
		withEnsuredReceiverAndArgumentsDo: [ :r :a |
			r
				perform: selector
				withArguments: a ]
		withEnoughArguments: anArray
		otherwise: [ ]