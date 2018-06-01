visiting
visitBlockNode: aBlockNode 
	"Answer the minimum enclosing node for aVariabe or nil if none.
	If the variable is accessed in more than one statement then
	aBlockNode is the
	enclosing node, otherwise it is which ever single block node that
	includes it, if any."
	^ (self
		enclosingNodeFor: [:aBlock | aBlockNode statements do: aBlock]
		of: aBlockNode)
		ifNotNil: [:aNode | aNode isBlockNode
				ifTrue: [aNode]
				ifFalse: [aBlockNode]]