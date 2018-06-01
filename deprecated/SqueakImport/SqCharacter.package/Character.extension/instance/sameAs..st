*SqCharacter-comparing
sameAs: aCharacter 
	"Answer whether the receiver is equal to aCharacter, ignoring case"
	
	self == aCharacter ifTrue: [ ^true ].
	^self asLowercase == aCharacter asLowercase
