contexts
pushBool: trueOrFalse

	trueOrFalse
		ifTrue: [ self push: objectMemory getTrueObj ]
		ifFalse: [ self push: objectMemory getFalseObj ].