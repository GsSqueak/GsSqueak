casing
toUppercaseCode: anInteger
	"Answer corresponding upper case code for a Character code.
	This does not handle special cases where several codes would be required."
	
	^ToUpper at: anInteger ifAbsent: [anInteger]