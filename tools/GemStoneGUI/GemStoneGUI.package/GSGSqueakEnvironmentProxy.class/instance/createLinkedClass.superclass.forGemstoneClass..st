interface 2
createLinkedClass: aName superclass: aSuperclass forGemstoneClass: aGsClass
	
	| query |
	
	query := '
	{1} at: {2} put: {3}.
	{3} superclass: ({4})
	' format: {
		self codeReferencingMe.
		aName asSymbol printString.
		aGsClass asString.
		aSuperclass
	}.