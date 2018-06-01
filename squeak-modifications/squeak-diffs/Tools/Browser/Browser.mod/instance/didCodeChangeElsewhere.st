self-updating
didCodeChangeElsewhere

	super didCodeChangeElsewhere ifTrue:
		[^true].
	self classDefinitionIndicated ifFalse:
		[^false].
	^self metaClassIndicated
		ifFalse:
			[classDefinition ~= (self selectedClass ifNotNil: [:selectedClass| selectedClass definition])]
		ifTrue:
			[metaClassDefinition ~= (self selectedClass ifNotNil: [:selectedClass| selectedClass theMetaClass definition])]