-Etoys-geometry
y
	"Return my vertical position relative to the cartesian origin of the
	playfield or the world. Note that larger y values are closer to the top of
	the screen."
	| _gsSqueakTemp_w _gsSqueakTemp_aPlayfield |
	_gsSqueakTemp_w := self world.
	_gsSqueakTemp_w
		ifNil: [^ bounds top].
	_gsSqueakTemp_aPlayfield := self referencePlayfield.
	^ _gsSqueakTemp_aPlayfield isNil
		ifTrue: [_gsSqueakTemp_w cartesianOrigin y - self referencePosition y]
		ifFalse: [_gsSqueakTemp_aPlayfield cartesianOrigin y - self referencePosition y]