misc
mouseX
	"Answer the x-coordinate of the mouse, in my coordinate system"
	^ self isInWorld
		ifTrue: [(self pointFromWorld: self cursorPoint) x - self cartesianOrigin x]
		ifFalse: [0]