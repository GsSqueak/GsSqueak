removing
remove: aCharacter
	"Don't signal an error when aCharacter is not present."

	^self remove: aCharacter ifAbsent: aCharacter