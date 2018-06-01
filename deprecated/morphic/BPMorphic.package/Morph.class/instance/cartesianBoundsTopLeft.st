-Etoys-geometry
cartesianBoundsTopLeft
	"Answer the origin of this morph relative to it's container's cartesian
	origin. 
	NOTE: y DECREASES toward the bottom of the screen"
	| _gsSqueakTemp_w _gsSqueakTemp_container |
	_gsSqueakTemp_w := self world
				ifNil: [^ bounds origin].
	_gsSqueakTemp_container := self referencePlayfield
				ifNil: [_gsSqueakTemp_w].
	^ bounds left - _gsSqueakTemp_container cartesianOrigin x @ (_gsSqueakTemp_container cartesianOrigin y - bounds top)