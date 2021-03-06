testing method dictionary
whichSelectorsStoreInto: instVarName 
	"Answer a collection of selectors whose methods access the argument, instVarName, as a named instance variable."
	
	| instVarIndex |
	instVarIndex := self instVarIndexFor: instVarName ifAbsent: [ ^Array new ].
	^ self methodDict keys select: 
		[:sel | (self methodDict at: sel) writesField: instVarIndex]

	"Point whichSelectorsStoreInto: 'x'."
