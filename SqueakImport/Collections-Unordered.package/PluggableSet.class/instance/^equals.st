comparing
= anObject
	"Two sets are equal if
	 (a) they are the same 'kind' of thing.
	 (b) they have the same set of keys.
	 (c) for each (common) key, they have the same value"

	self == anObject ifTrue: [ ^true ].
	self species == anObject species ifFalse: [ ^false ].
	hashBlock = anObject hashBlock ifFalse: [ ^false ].
	equalBlock = anObject equalBlock ifFalse: [ ^false ].
	self size = anObject size ifFalse: [ ^false ].
	^self allSatisfy: [ :each | anObject includes: each ]