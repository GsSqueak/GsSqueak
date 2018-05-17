query
methodsWithUnboundGlobals
	"Get all methods that use undeclared global objects that are not listed in Undeclared. For a clean image the result should be empty."

	"SystemNavigation new methodsWithUnboundGlobals"
	self flag: #environments.
	
	^self allSelect:
		[:m|
		m literals anySatisfy:
			[:l|
			l isVariableBinding
			and: [l key isSymbol "avoid class-side methodClass literals"
			and: [(m methodClass bindingOf: l key)
					ifNil: [(Undeclared associationAt: l key ifAbsent: []) ~~ l]
					ifNotNil: [:b| b ~~ l]]]]]