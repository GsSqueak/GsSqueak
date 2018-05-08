comparing
= anObject
	^self species == anObject species
		and: [ anObject canBeEnumerated
			and: [ self wideCharacterMap = anObject wideCharacterMap ] ]
