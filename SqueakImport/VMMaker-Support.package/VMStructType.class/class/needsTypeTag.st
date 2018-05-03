translation
needsTypeTag
	self instVarNamesAndTypesForTranslationDo:
		[:ivn :type|
		((type isArray ifTrue: [type first] ifFalse: [type]) includesSubString: self structTagName) ifTrue:
			[^true]].
	^false