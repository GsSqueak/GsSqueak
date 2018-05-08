removing
remove: aCharacter
	"This means aCharacter is now absent from myself.
	It must be added to my absent."
	
	byteArrayMap := nil.
	^absent add: aCharacter
