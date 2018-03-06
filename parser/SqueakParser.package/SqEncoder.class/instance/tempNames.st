results
tempNames
	^ self tempNodes
		collect: [:node | (node isMemberOf: SqMessageAsTempNode)
				ifTrue: [scopeTable keyAtValue: node]
				ifFalse: [node key]]