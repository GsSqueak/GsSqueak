macro transformations
transformCase: encoder 
	| caseNode |
	caseNode := arguments first.
	(caseNode isMemberOf: SqBraceNode)
		ifFalse: [^ false].
	(caseNode blockAssociationCheck: encoder)
		ifFalse: [^ false].
	(arguments size = 1
			or: [self
					checkBlock: arguments last
					as: 'otherwise arg'
					from: encoder
					maxArgs: 0])
		ifFalse: [^ false].
	caseNode elements
		do: [:messageNode | 
			messageNode receiver noteOptimizedIn: self.
			messageNode arguments first noteOptimizedIn: self].
	arguments size = 2
		ifTrue: [arguments last noteOptimizedIn: self].
	^ true