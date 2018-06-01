visiting
visitMessageNode: aMessageNode 
	"Answer the minimum enclosing node for aVariabe or nil if none.
	If the variable is accessed in more than one subexpression then
	aMessageNode is the
	enclosing node, otherwise it is which ever single node that includes it,
	if any."
	^ self
		enclosingNodeFor: [:aBlock | 
			aBlock value: aMessageNode receiver.
			aMessageNode argumentsInEvaluationOrder do: aBlock]
		of: aMessageNode