handles
addPaintBgdHandle: haloSpec 
	(innerTarget isKindOf: PasteUpMorph)
		ifTrue: [self
				addHandle: haloSpec
				on: #mouseDown
				send: #paintBackground
				to: innerTarget]