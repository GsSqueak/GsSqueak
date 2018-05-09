casing
toLowercaseCode: anInteger
	"Answer corresponding lower case code for a Character code.
	This does not handle special cases where several codes would be required."
	
	^ToLower at: anInteger ifAbsent: [anInteger]