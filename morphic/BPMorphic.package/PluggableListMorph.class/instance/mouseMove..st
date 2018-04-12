events
mouseMove: evt 
	(self dropEnabled
			and: [evt hand hasSubmorphs])
		ifFalse: [^ super mouseMove: evt].
	potentialDropRow
		ifNotNil: [potentialDropRow
					= (self rowAtLocation: evt position)
				ifTrue: [^ self]].
	self mouseLeaveDragging: evt.
	(self containsPoint: evt position)
		ifTrue: [self mouseEnterDragging: evt]