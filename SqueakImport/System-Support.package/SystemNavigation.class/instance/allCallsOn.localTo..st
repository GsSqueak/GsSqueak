query
allCallsOn: aLiteral localTo: aClass
	"Answer a sorted collection of MethodReferences for all the methods that call on aLiteral in, above or below the given class."

	^self
		allCallsOn: aLiteral
		fromBehaviors: (Array streamContents: [ :stream |
			aClass theNonMetaClass withAllSuperAndSubclassesDoGently: [ :each |
				stream nextPut: each ].
			aClass theNonMetaClass class withAllSuperAndSubclassesDoGently: [ :each |
				stream nextPut: each ] ])
		sorted: true