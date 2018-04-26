accessing
at: key put: anObject 
	"Set the value at key to be anObject.  If key is not found, create a
	new entry for key and set is value to anObject. Answer anObject."

	| index |
	index := self scanFor: key.
	(array at: index)
		ifNil:
			["it's possible to get here if the association just died"
			self atNewIndex: index put: (self associationClass key: key value: anObject) ]
		ifNotNil: [ :association | 
			association == vacuum
				ifTrue: [ self atNewIndex: index put: (self associationClass key: key value: anObject) ]
				ifFalse: [association value: anObject ] ].
	^anObject