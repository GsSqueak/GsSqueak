initialization
initHierarchyForClass: aClassOrMetaClass 
	| nonMetaClass superclasses |
	centralClass := aClassOrMetaClass.
	nonMetaClass := aClassOrMetaClass theNonMetaClass.
	self selectEnvironment: aClassOrMetaClass environment.
	metaClassIndicated := aClassOrMetaClass isMeta.
	classDisplayList := OrderedCollection new.
	(superclasses := nonMetaClass allSuperclasses reversed) withIndexDo:
		[ : each : indent | classDisplayList add:
			(String streamContents:
				[ : stream | indent - 1 timesRepeat: [ stream nextPutAll: '  ' ].
				stream nextPutAll: each name ]) ].
	nonMetaClass
		allSubclassesWithLevelDo:
			[ : eachClass : lvl | classDisplayList add:
				(String streamContents:
					[ : stream | lvl timesRepeat: [ stream nextPutAll: '  ' ].
					stream nextPutAll: eachClass name ]) ]
		startingLevel: superclasses size.
		
	self changed: #classList.
	self selectClass: nonMetaClass