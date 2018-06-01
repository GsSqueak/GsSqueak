private
arraySearch: aSymbol messageNode: aParseNode addTo: aCollection 
	"Find literals ahead of aSymbol from arrays in the method."
	"self new arraySearch: #hello messageNode: (self
	decompile: #arraySearch:messageNode:addTo:) addTo: Set new"
	self flag: #(#ignore #detected #hello ).
	((aParseNode isMemberOf: LiteralNode)
			and: [aParseNode key isMemberOf: Array])
		ifTrue: [self
				arraySearch: aSymbol
				fromArray: aParseNode key
				addTo: aCollection].
	(aParseNode notNil
			and: [aParseNode isLeaf not])
		ifTrue: [aParseNode getAllChildren
				do: [:child | self
						arraySearch: aSymbol
						messageNode: child
						addTo: aCollection]].
	^ aCollection