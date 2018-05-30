initialization
selectClassNamed: aSymbolOrString
	| newClassName |
	newClassName := aSymbolOrString ifNotNil: [ aSymbolOrString asSymbol ].
	selectedSystemCategory := (systemOrganizer categories at:
			(systemOrganizer numberOfCategoryOfElement: newClassName) ifAbsent: [ nil ]).
			
	super selectClassNamed: newClassName.
	self changed: #systemCategorySingleton.	
	
	^ newClassName.