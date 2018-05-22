handles
addPoohHandle: handleSpec
	(innerTarget isKindOf: (Smalltalk at: #WonderlandCameraMorph ifAbsent:[nil])) ifTrue:
		[self addHandle: handleSpec on: #mouseDown send: #strokeMode to: innerTarget]
