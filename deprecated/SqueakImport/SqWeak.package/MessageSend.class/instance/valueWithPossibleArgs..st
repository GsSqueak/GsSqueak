evaluating
valueWithPossibleArgs: anArray
	"Send selector to the receiver with arguments in anArray. Only use enough arguments for the arity of the selector; supply nils for missing ones."
	
	^receiver perform: selector withEnoughArguments: anArray