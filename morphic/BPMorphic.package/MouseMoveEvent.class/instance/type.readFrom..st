initialize
type: eventType readFrom: aStream 
	| _gsSqueakTemp_x _gsSqueakTemp_y |
	super type: eventType readFrom: aStream.
	aStream skip: 1.
	_gsSqueakTemp_x := Integer readFrom: aStream.
	aStream skip: 1.
	_gsSqueakTemp_y := Integer readFrom: aStream.
	startPoint := _gsSqueakTemp_x @ _gsSqueakTemp_y