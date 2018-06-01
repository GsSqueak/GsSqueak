handles
addRepaintHandle: haloSpec
	(innerTarget isSketchMorph) ifTrue:
		[self addHandle: haloSpec
				on: #mouseDown send: #editDrawing to: innerTarget]
