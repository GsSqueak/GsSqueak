dragging
startDragTarget: event

	self positionOffset: (event position - (self target point: self target position in: self owner)).		
	event hand newMouseFocus: self.