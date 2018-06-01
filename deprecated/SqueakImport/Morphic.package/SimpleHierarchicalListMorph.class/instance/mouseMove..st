event handling
mouseMove: evt

	(self dropEnabled and:[evt hand hasSubmorphs]) 
		ifFalse:[^super mouseMove: evt].
	potentialDropMorph ifNotNil:[
		(potentialDropMorph containsPoint: (potentialDropMorph point: evt position from: self))
			ifTrue:[^self].
	].
	self mouseLeaveDragging: evt.
	(self containsPoint: evt position) 
		ifTrue:[self mouseEnterDragging: evt].