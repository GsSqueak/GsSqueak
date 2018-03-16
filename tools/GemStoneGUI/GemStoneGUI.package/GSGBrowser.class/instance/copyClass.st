class functions
copyClass
	| originalClass originalName copysName |
	self hasClassSelected ifFalse: [^ self].
	self okToChange ifFalse: [^ self].
	originalClass := self selectedClass.
	originalName := originalClass name.
	copysName := self request: 'Please type new class name' initialAnswer: originalName.
	copysName = '' ifTrue: [^ self].  " Cancel returns '' "
	copysName := copysName asSymbol.
	copysName = originalName ifTrue: [^ self].
	(self environment hasClassNamed: copysName)
		ifTrue: [^ self error: copysName , ' already exists'].
	Cursor wait showWhile: [
		| newDefinition newMetaDefinition newClass |
		newDefinition := originalClass definition
			copyReplaceAll: originalName printString
			with: copysName printString.
		newClass := originalClass superclass subclassDefinerClass 
						evaluate: newDefinition 
						environment: self environment
						logged: true.
		newMetaDefinition := originalClass class definition
			copyReplaceAll: originalClass class name
			with: newClass class name.
		Compiler evaluate: newMetaDefinition environment: self environment
			logged: true.
		newClass copyAllCategoriesFrom: originalClass.
		newClass class copyAllCategoriesFrom: originalClass class.
		originalClass hasComment ifTrue: [
			newClass comment: originalClass comment ] ].
	self classListIndex: 0.
	self changed: #classList