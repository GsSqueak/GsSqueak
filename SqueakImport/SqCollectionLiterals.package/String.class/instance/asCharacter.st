converting
asCharacter
	"Answer the receiver's first character, or '*' if none.  Idiosyncratic, provisional."

	^ self size > 0 ifTrue: [self first] ifFalse:[$·]