private
search: aSymbol messageNode: aParseNode addTo: aCollection 
	"self new search: #translated messageNode: (Project decompile: #updateLocaleDependentsWithPreviousSupplies:gently:) addTo: OrderedCollection new"

	((aParseNode isMemberOf: MessageNode)
			and: [(aParseNode selector isMemberOf: SelectorNode)
					and: [aParseNode selector key = aSymbol]])
		ifTrue: [aCollection add: aParseNode].
	(aParseNode notNil
			and: [aParseNode isLeaf not])
		ifTrue: [aParseNode getAllChildren
				do: [:child | self
						search: aSymbol
						messageNode: child
						addTo: aCollection]].
	^ aCollection