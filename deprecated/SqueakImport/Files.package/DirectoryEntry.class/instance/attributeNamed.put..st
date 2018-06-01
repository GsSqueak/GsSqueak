access
attributeNamed: aString put: anObject
	"Set the value of attribute named aString.  This is provided for extension by third-party developers."
	^ self attributes 
		at: aString
		put: anObject