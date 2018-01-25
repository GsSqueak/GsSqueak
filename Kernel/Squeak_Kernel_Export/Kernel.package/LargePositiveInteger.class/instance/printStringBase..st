printing
printStringBase: base
	"For LargeIntegers, it's faster to use the stream version.
	This reproduces Number implementation to avoid speed down if one defines Integer>>#printStringBase:
	This method should be removed if  Integer>>#printStringBase: is removed.
	Note: tests preallocating stream space with exact numberOfDigitsInBase: did not gain speed"
	
	^String streamContents: [:str | self printOn: str base: base]