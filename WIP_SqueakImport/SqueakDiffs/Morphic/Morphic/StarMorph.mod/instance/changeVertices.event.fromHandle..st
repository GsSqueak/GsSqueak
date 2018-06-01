editing
changeVertices: label event: evt fromHandle: handle 
	| |
	label == #more
		ifTrue: [evt shiftPressed
				ifTrue: [self moreVertices "not oneMoreVertex"]
				ifFalse: [self moreVertices]].
	label == #less
		ifTrue: [evt shiftPressed
				ifTrue: [self lessVertices "not oneLessVertex"]
				ifFalse: [self lessVertices]].
	label == #next
		ifTrue: [evt shiftPressed
				ifTrue: [self makeVertices: vertices size starRatio: self nextSkip]
				ifFalse: [self makeVertices: vertices size starRatio: self nextTwinkleSkip]].
	label == #prev
		ifTrue: [evt shiftPressed
				ifTrue: [self makeVertices: vertices size starRatio: self prevSkip]
				ifFalse: [self makeVertices: vertices size starRatio: self prevTwinkleSkip]].
	self computeBounds