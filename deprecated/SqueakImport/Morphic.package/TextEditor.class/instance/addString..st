typing support
addString: aString

	morph readOnly ifTrue: [^ self].

	"If we modifying the text like backward or forward delete, we have to finish that operation."
	(self isTypingIn and: [self history current type notNil])
		ifTrue: [self closeTypeIn].

	self typeAhead nextPutAll: aString.