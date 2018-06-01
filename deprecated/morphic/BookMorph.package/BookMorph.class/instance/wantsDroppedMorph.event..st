dropping/grabbing
wantsDroppedMorph: aMorph event: evt 
	(currentPage bounds
			containsPoint: (self pointFromWorld: evt cursorPoint))
		ifFalse: [^ false].
	^ super wantsDroppedMorph: aMorph event: evt