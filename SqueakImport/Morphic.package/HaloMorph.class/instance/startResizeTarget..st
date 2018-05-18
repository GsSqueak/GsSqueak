dragging or resizing
startResizeTarget: event
	"Begin resizing the target"
	growingOrRotating := true.
	positionOffset := event position.
	originalExtent := target extent.
	self removeAllHandlesBut: nil.
	event hand newMouseFocus: self.
	event hand addMouseListener: self. "add handles back on mouse-up"