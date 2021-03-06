testing method dictionary
whichSelectorsAccess: instVarName 
	"Answer a collection of selectors whose methods access the argument, instVarName, as a named instance variable."
	"Point whichSelectorsAccess: 'x'."
	
	| instVarIndex |
	instVarIndex := self instVarIndexFor: instVarName ifAbsent: [ ^Array new ].
	^Array streamContents: [ :stream |
		self selectorsAndMethodsDo: [ :selector :method |
			((method readsField: instVarIndex) or: [
				method writesField: instVarIndex ]) ifTrue: [
					stream nextPut: selector ] ] ]
