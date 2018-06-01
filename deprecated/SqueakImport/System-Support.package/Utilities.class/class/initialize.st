class initialization
initialize
	(self classVarNames includes: 'ScrapsBook') ifTrue: [self removeClassVarName: 'ScrapsBook'].