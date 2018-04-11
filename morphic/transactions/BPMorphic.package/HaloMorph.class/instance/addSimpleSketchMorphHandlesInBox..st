private
addSimpleSketchMorphHandlesInBox: box 
	self
		addGraphicalHandle: #PaintTab
		at: box bottomCenter
		on: #mouseDown
		send: #editDrawing
		to: self innerTarget.
	self addDirectionHandles