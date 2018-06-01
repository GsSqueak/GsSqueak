-Etoys-geometry
x
	"Return my horizontal position relative to the cartesian origin of a
	relevant playfield"
	| _gsSqueakTemp_aPlayfield |
	_gsSqueakTemp_aPlayfield := self referencePlayfield.
	^ _gsSqueakTemp_aPlayfield isNil
		ifTrue: [self referencePosition x]
		ifFalse: [self referencePosition x - _gsSqueakTemp_aPlayfield cartesianOrigin x]