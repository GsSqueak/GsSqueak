debugger access
print: anObject on: aStream
	"Safely print anObject in the face of direct ProtoObject subclasses."
	| objClass title |
	objClass := self objectClass: anObject.
	(objClass canUnderstand: #printOn:) ifTrue:
		[^anObject printOn: aStream].
	title := objClass name.
	aStream
		nextPutAll: (title first isVowel ifTrue: ['an '] ifFalse: ['a ']);
		nextPutAll: title