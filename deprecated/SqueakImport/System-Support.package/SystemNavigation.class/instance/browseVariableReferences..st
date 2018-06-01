browse
browseVariableReferences: aClass
	aClass chooseVarThenDo:
		[ : aVar | (aClass allInstVarNames includes: aVar)
			ifTrue:
				[ self
					browseAllAccessesTo: aVar
					from: aClass ]
			ifFalse: [ self browseAllCallsOn: aVar ] ]