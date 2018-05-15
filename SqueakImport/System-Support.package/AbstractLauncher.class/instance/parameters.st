private
parameters
	parameters == nil
		ifTrue: [parameters := Smalltalk namedArguments].
	^parameters