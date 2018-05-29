construction
addHandlesIn: frame
	| handle |
	handle := PolygonMorph
		vertices: (Array with: 0@0 with: 8@0 with: 4@8)
		color: Color orange borderWidth: 1 borderColor: Color black.
	handle addMorph: ((RectangleMorph
			newBounds: ((self handleOffset: handle)-(2@0) extent: 1@(graphArea height-2))
			color: Color orange) borderWidth: 0).

	limitHandles := Array with: handle with: handle veryDeepCopy with: handle veryDeepCopy.
	1 to: limitHandles size do:
		[:i | handle := limitHandles at: i.
		handle on: #mouseDown
				send: #limitHandleMove:event:from:
				to: self withValue: i.
		handle on: #mouseMove
				send: #limitHandleMove:event:from:
				to: self withValue: i.
		self addMorph: handle.
		handle position: ((self xFromMs: 
			(envelope points at: (limits at: i)) x) @ 
				(graphArea top)) - (self handleOffset: handle)]