tablet
tabletPressure
	"Answer the current pressure of the first tablet pointing device (pen,
	puck, or eraser), a number between 0.0 (no pressure) and 1.0 (max
	pressure) "
	| _gsSqueakTemp_params _gsSqueakTemp_data |
	_gsSqueakTemp_params := self primTabletGetParameters: 1.
	_gsSqueakTemp_params
		ifNil: [^ self].
	_gsSqueakTemp_data := self primTabletRead: 1.
	"state of first/primary pen"
	^ (_gsSqueakTemp_data at: 10) asFloat / ((_gsSqueakTemp_params at: 10)
			- 1)