-widgets-geometry-override
privateMoveBy: delta 
	"Private! Use 'position:' instead."
	| _gsSqueakTemp_fill |
	self player notNil
		ifTrue: ["Most cases eliminated fast by above test"
			self getPenDown
				ifTrue: ["If this is a costume for a player with its 
					pen down, draw a line."
					self moveWithPenDownBy: delta]].
	bounds := bounds translateBy: delta.
	fullBounds
		ifNotNil: [fullBounds := fullBounds translateBy: delta].
	_gsSqueakTemp_fill := self fillStyle.
	_gsSqueakTemp_fill isOrientedFill
		ifTrue: [_gsSqueakTemp_fill origin: _gsSqueakTemp_fill origin + delta].
	"Widgets: Emit position change."
	self positionChanged: self position