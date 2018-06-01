events
mouseLeaveDragging: anEvent

	self hoverRow: nil.
	(self dropEnabled and:[anEvent hand hasSubmorphs]) ifFalse: ["no d&d"
		^ super mouseLeaveDragging: anEvent].
	self resetPotentialDropRow.
	anEvent hand releaseMouseFocus: self.
	"above is ugly but necessary for now"
