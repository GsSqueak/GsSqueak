visiting
visitAssignmentNode: anAssignmentNode 
	"Answer the minimum enclosing node for aVariabe or nil if none.
	If the variable is accessed in more than one subexpression then
	anAssignmentNode is the enclosing node, otherwise it is which ever
	single node that includes it, if any."
	^ self
		enclosingNodeFor: [:aBlock | aBlock value: anAssignmentNode value;
				 value: anAssignmentNode variable]
		of: anAssignmentNode