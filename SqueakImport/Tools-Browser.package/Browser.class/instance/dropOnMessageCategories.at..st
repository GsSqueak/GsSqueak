drag and drop
dropOnMessageCategories: method at: index

	| sourceClass destinationClass category copy |
	copy := Sensor shiftPressed.
	(method isKindOf: CompiledMethod) 
		ifFalse:[^self inform: 'Can only drop methods'].
	sourceClass := method methodClass.
	destinationClass := self selectedClassOrMetaClass.
	sourceClass == destinationClass ifTrue:[
		category := self messageCategoryList at: index.
		category = ClassOrganizer allCategory ifTrue: [^false].
		destinationClass organization classify: method selector  under: category suppressIfDefault: false logged: true.
		^true ].
	(copy
		or: [ (destinationClass inheritsFrom: sourceClass)
		or: [ (sourceClass inheritsFrom: destinationClass)
		or: [ sourceClass theNonMetaClass == destinationClass theNonMetaClass ] ] ])
		ifFalse: [
			(self confirm: (
				'Classes "{1}" and "{2}" are unrelated.{3}Are you sure you want to move this method?'
					format: { sourceClass. destinationClass. Character cr })) 
						ifFalse: [ ^false ] ].
	destinationClass
		compile: method getSource
		classified: (self messageCategoryList at: index)
		withStamp: method timeStamp
		notifying: nil.
	copy ifFalse: [
		sourceClass removeSelector: method selector ].
	^true