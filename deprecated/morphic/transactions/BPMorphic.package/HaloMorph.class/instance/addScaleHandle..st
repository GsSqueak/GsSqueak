handles
addScaleHandle: haloSpec 
	target isFlexMorph
		ifTrue: [(self
				addHandle: haloSpec
				on: #mouseDown
				send: #startScale:with:
				to: self)
				on: #mouseMove
				send: #doScale:with:
				to: self]