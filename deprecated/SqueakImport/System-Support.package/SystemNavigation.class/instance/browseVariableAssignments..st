browse
browseVariableAssignments: aClass 
	aClass chooseVarThenDo:
		[ : aVar | self
			browseAllStoresInto: aVar
			from: aClass ]