testing
isOnlySubnodeOf: aSubtree in: aParseTree 
	"<ParseNode>"
	"<ParseNode>"
	"Answer if the receiver only occurs within aSubtree of aParseTree, not
	in the rest of aParseTree.
	Assumes that aSubtree is in fact a subnode of aParseTree."
	| isSubnode |
	isSubnode := false.
	aSubtree
		accept: (SqParseNodeEnumerator
				ofBlock: [:node | node == self
						ifTrue: [isSubnode := true]]).
	isSubnode
		ifFalse: [^ false].
	aParseTree
		accept: (SqParseNodeEnumerator
				ofBlock: [:node | node == self
						ifTrue: [^ false]]
				select: [:node | node ~= aSubtree]).
	^ true