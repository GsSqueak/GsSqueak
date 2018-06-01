debugging
inspectCollection: aCollection notifying: aView 
	aCollection size = 0
		ifTrue: [aView notNil
				ifTrue: [^ aView flash]
				ifFalse: [^ self]].
	aCollection size = 1
		ifTrue: [aCollection first inspect]
		ifFalse: [aCollection asArray inspect]