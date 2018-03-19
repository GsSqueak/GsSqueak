-Etoys-geometry
x: aNumber 
	"Set my horizontal position relative to the cartesian origin of the
	playfield or the world."
	| _gsSqueakTemp_offset _gsSqueakTemp_aPlayfield _gsSqueakTemp_newX |
	_gsSqueakTemp_aPlayfield := self referencePlayfield.
	_gsSqueakTemp_offset := self left - self referencePosition x.
	_gsSqueakTemp_newX := _gsSqueakTemp_aPlayfield isNil
				ifTrue: [aNumber + _gsSqueakTemp_offset]
				ifFalse: [_gsSqueakTemp_aPlayfield cartesianOrigin x + aNumber + _gsSqueakTemp_offset].
	self position: _gsSqueakTemp_newX @ bounds top