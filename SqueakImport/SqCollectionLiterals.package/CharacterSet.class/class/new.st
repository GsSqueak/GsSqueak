*SqCollectionLiterals-*SqCollectionLiterals-instance creation
new
	self = CharacterSet ifTrue: [^ByteCharacterSet new].
	^super new
