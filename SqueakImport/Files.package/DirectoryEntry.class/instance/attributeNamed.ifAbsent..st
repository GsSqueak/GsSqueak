access
attributeNamed: aString ifAbsent: oneArgBlock 
	"Answer the value of attribute named aString.  If no attribute by that name has ever been set, answer oneArgBlock value."
	^ self attributes 
		at: aString
		ifAbsent: oneArgBlock