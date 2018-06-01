recent colors
mouseUpRecent: evt with: aMorph 
	aMorph
		borderColor: (Color
				r: 0.194
				g: 0.258
				b: 0.194).
	(aMorph containsPoint: evt cursorPoint)
		ifTrue: [self takeColor: aMorph color event: evt]