conversion
errorMalformedInput: aString
	"Invalid UTF-8 input has been detected in the given string.
	Raise an error if strict conversions are enabled, otherwise allow
	the original string to be returned."
	
	^self class errorMalformedInput: aString