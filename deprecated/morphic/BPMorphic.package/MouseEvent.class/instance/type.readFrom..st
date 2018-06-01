initialize
type: eventType readFrom: aStream 
	| _gsSqueakTemp_x _gsSqueakTemp_y |
	type := eventType.
	timeStamp := Integer readFrom: aStream.
	aStream skip: 1.
	_gsSqueakTemp_x := Integer readFrom: aStream.
	aStream skip: 1.
	_gsSqueakTemp_y := Integer readFrom: aStream.
	aStream skip: 1.
	buttons := Integer readFrom: aStream.
	position := _gsSqueakTemp_x @ _gsSqueakTemp_y