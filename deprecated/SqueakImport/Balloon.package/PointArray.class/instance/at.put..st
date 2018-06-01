accessing
at: index put: aPoint
	"Store the argument aPoint at the given index"
	super at: index * 2 - 1 put: aPoint x asInteger.
	super at: index * 2 put: aPoint y asInteger.
	^aPoint