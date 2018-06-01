layout
minimizePartsBinSize
	self layoutChanged; fullBounds.
	self fixLayoutFrames.
	self setExtentFromHalo: (self minimumWidth @ self minimumHeight) 