traits
makeSampleInstance
	| aClass nonMetaClass anInstance |
	((aClass := self selectedClassOrMetaClass) isNil or: [aClass isTrait]) ifTrue: [^ self].
	nonMetaClass := aClass theNonMetaClass.
	anInstance := self sampleInstanceOfSelectedClass.
	(anInstance isNil and: [nonMetaClass ~~ UndefinedObject]) ifTrue: 
		[^ self inform: 'Sorry, cannot make an instance of ', nonMetaClass name].

	(Smalltalk isMorphic and: [anInstance isMorph])
		ifTrue:
			[self currentHand attachMorph: anInstance]
		ifFalse:
			[anInstance inspectWithLabel: 'An instance of ', nonMetaClass name]