*SqCollectionLiterals-*SqCollectionLiterals-accessing
at: key put: anObject 
	"Set the value at key to be anObject.  If key is not found, create a
	new entry for key and set is value to anObject. Answer anObject."

	| index |
	index := self scanFor: key.
	(array at: index)
		ifNil: [ self atNewIndex: index put: (self associationClass key: key value: anObject) ]
		ifNotNil: [ :association | association value: anObject ].
	^anObject
