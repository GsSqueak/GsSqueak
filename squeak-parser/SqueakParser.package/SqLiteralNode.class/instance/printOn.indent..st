printing
printOn: aStream indent: level 
	key isVariableBinding
		ifTrue: [key key isNil
				ifTrue: [aStream nextPutAll: '###';
						 nextPutAll: key value soleInstance name]
				ifFalse: [aStream nextPutAll: '##';
						 nextPutAll: key key].
			^ self].
	key isLiteral
		ifTrue: [key printAsLiteralOn: aStream.
			^ self].
	key storeOn: aStream