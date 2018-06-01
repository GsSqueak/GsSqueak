event handling
mouseLeaveDragging: anEvent 
	self hoveredMorph: nil.
	(self dropEnabled
			and: [anEvent hand hasSubmorphs])
		ifFalse: ["no d&d"
			^ super mouseLeaveDragging: anEvent].
	self resetPotentialDropMorph.
	anEvent hand releaseMouseFocus: self