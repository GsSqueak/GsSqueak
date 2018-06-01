events
update: aSymbol
	
	self stateVariables do:
		[:var | 
		(spec perform: var) == aSymbol ifTrue:
			[self refresh: var with: aSymbol.
			^ self]]