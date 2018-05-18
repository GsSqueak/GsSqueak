events
doFastFrameDrag: grabPoint
	"Do fast frame dragging from the given point"

	| offset newBounds outerWorldBounds clearArea |
	outerWorldBounds := self boundsIn: nil.
	offset := outerWorldBounds origin - grabPoint.
	clearArea := ActiveWorld clearArea.
	newBounds := outerWorldBounds newRectFrom: [:f |
		| p selector |
		p := Sensor cursorPoint.
		(self class dragToEdges and: [(selector := self dragToEdgesSelectorFor: p in: clearArea) notNil])
			ifTrue: [clearArea perform: selector]
			ifFalse: [p + offset extent: outerWorldBounds extent]].
	self bounds: newBounds; comeToFront