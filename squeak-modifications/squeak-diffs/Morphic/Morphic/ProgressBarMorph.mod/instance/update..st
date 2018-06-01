updating
update: aSymbol 
	aSymbol == #contents
		ifTrue: 
			[lastValue := value contents.
			self changed]