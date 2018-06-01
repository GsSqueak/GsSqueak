editing
attributesAt: aPoint
	"Answer the attributes at the given point"
	^text attributesAt: (self characterBlockAtPoint: aPoint) stringIndex forStyle: textStyle