world state
paintArea
	"What rectangle should the user be allowed to create a new painting
	in?? An area beside the paintBox. Allow playArea to override with its
	own bounds!"
	| playfield paintBoxBounds |
	playfield := self
				submorphNamed: 'playfield'
				ifNone: [].
	playfield
		ifNotNil: [^ playfield bounds].
	paintBoxBounds := self paintBox bounds.
	self firstHand targetPoint x < paintBoxBounds center x
		ifTrue: [^ bounds topLeft corner: paintBoxBounds left @ bounds bottom"paint on left side"]
		ifFalse: [^ paintBoxBounds right @ bounds top corner: bounds bottomRight]