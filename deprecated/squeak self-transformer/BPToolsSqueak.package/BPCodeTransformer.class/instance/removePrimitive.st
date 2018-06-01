transforming
removePrimitive
	ast primitive == 0 ifTrue: [
		^ self. ].
	
	ast primitive:  0.
	ast block statements addFirst: self selfHaltNode.