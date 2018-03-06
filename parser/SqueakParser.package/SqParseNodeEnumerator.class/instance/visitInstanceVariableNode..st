visiting
visitInstanceVariableNode: anInstanceVariableNode 
	(theSelectBlock isNil
			or: [theSelectBlock value: anInstanceVariableNode])
		ifFalse: [^ nil].
	theBlock value: anInstanceVariableNode.
	^ super visitInstanceVariableNode: anInstanceVariableNode