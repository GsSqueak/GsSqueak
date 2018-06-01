events
mouseEnterDragging: evt 
	(evt hand hasSubmorphs
			and: [self dropEnabled])
		ifFalse: ["no d&d"
			^ super mouseEnterDragging: evt].
	(self wantsDroppedMorph: evt hand firstSubmorph event: evt)
		ifTrue: [potentialDropRow := self rowAtLocation: evt position.
			evt hand newMouseFocus: self.
			self changed]