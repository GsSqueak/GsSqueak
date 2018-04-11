dragging or resizing
startDragTarget: event 
	event controlKeyPressed
		ifTrue: [self startResizeTarget: event]
		ifFalse: [growingOrRotating := false.
			super startDragTarget: event]