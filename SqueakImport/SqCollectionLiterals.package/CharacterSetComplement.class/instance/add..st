*SqCollectionLiterals-*SqCollectionLiterals-adding
add: aCharacter 
	"a character is present if not absent, so adding a character is removing it from the absent"
	
	(absent includes: aCharacter)
		ifTrue:
			[byteArrayMap := nil.
			absent remove: aCharacter].
	^ aCharacter
