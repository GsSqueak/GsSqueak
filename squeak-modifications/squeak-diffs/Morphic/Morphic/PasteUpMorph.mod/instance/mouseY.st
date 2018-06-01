misc
mouseY
	"Answer the y-coordinate of the mouse, in my coordinate system"

	^ self isInWorld
		ifTrue:
			[self cartesianOrigin y - ((self pointFromWorld: self cursorPoint) y)]
		ifFalse:
			[0]