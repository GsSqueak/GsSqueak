tablet
tabletPoint
	"Answer the current position of the first tablet pointing device (pen,
	puck, or eraser) in tablet coordinates."
	| _gsSqueakTemp_data |
	_gsSqueakTemp_data := self primTabletRead: 1.
	"state of first/primary pen"
	^ (_gsSqueakTemp_data at: 3)
		@ (_gsSqueakTemp_data at: 4)