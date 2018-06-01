-Etoys-geometry
y: aNumber 
	"Set my vertical position relative to the cartesian origin of the playfield
	or the world. Note that larger y values are closer to the top of the
	screen. "
	| _gsSqueakTemp_w _gsSqueakTemp_offset _gsSqueakTemp_newY _gsSqueakTemp_aPlayfield |
	_gsSqueakTemp_w := self world.
	_gsSqueakTemp_w
		ifNil: [^ self position: bounds left @ aNumber].
	_gsSqueakTemp_aPlayfield := self referencePlayfield.
	_gsSqueakTemp_offset := self top - self referencePosition y.
	_gsSqueakTemp_newY := _gsSqueakTemp_aPlayfield isNil
				ifTrue: [_gsSqueakTemp_w bottom - aNumber + _gsSqueakTemp_offset]
				ifFalse: [_gsSqueakTemp_aPlayfield cartesianOrigin y - aNumber + _gsSqueakTemp_offset].
	self position: bounds left @ _gsSqueakTemp_newY