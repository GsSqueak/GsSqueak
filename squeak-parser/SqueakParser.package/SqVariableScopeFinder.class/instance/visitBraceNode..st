visiting
visitBraceNode: aBraceNode 
	"Answer the minimum enclosing node for aVariabe or nil if none.
	If the variable is accessed in more than one subexpression then
	aBraceNode is the enclosing node, otherwise it is which ever single
	node that includes it, if any."
	^ self
		enclosingNodeFor: [:aBlock | aBraceNode elements do: aBlock]
		of: aBraceNode