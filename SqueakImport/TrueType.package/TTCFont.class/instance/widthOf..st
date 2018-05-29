public
widthOf: aCharacter
	"This method cannot use #formOf: because formOf: discriminates the color and causes unnecessary bitmap creation."
	(self hasGlyphOf: aCharacter) ifFalse: [
		(fallbackFont notNil and: [fallbackFont hasGlyphOf: aCharacter]) ifTrue:
			[^ fallbackFont widthOf: aCharacter].
		^ 1
	].
	^(self formOf: aCharacter) width