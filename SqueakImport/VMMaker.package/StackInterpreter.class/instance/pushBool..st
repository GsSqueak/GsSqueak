internal interpreter access
pushBool: trueOrFalse
	self push: (trueOrFalse
				ifTrue: [objectMemory trueObject]
				ifFalse: [objectMemory falseObject])