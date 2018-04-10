handles
positionIn: aBox horizontalPlacement: horiz verticalPlacement: vert 
	| _gsSqueakTemp_xCoord _gsSqueakTemp_yCoord |
	horiz == #left
		ifTrue: [_gsSqueakTemp_xCoord := aBox left].
	horiz == #leftCenter
		ifTrue: [_gsSqueakTemp_xCoord := aBox left + (aBox width // 4)].
	horiz == #center
		ifTrue: [_gsSqueakTemp_xCoord := aBox left + aBox right // 2].
	horiz == #rightCenter
		ifTrue: [_gsSqueakTemp_xCoord := aBox left + (3 * aBox width // 4)].
	horiz == #right
		ifTrue: [_gsSqueakTemp_xCoord := aBox right].
	vert == #top
		ifTrue: [_gsSqueakTemp_yCoord := aBox top].
	vert == #topCenter
		ifTrue: [_gsSqueakTemp_yCoord := aBox top + (aBox height // 4)].
	vert == #center
		ifTrue: [_gsSqueakTemp_yCoord := aBox top + aBox bottom // 2].
	vert == #bottomCenter
		ifTrue: [_gsSqueakTemp_yCoord := aBox top + (3 * aBox height // 4)].
	vert == #bottom
		ifTrue: [_gsSqueakTemp_yCoord := aBox bottom].
	^ _gsSqueakTemp_xCoord asInteger @ _gsSqueakTemp_yCoord asInteger