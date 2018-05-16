query
allUnboundMethods
	"Answer all CompiledMehtods that are not in the class hierarchy"
	"self systemNavigation allUnboundMethods"
	^CompiledMethod allSubInstances select:
		[:m|
		 m methodClass
			ifNil: [true]
			ifNotNil:
				[:mc|
				(mc compiledMethodAt: m selector ifAbsent: []) ~~ m]]