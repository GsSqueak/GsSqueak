private
positionDirectionShaft: shaft 
	"Position the shaft."
	"Pretty crude and slow approach at present, but a stake in the ground"
	| _gsSqueakTemp_alphaRadians _gsSqueakTemp_unitVector |
	_gsSqueakTemp_alphaRadians := target heading degreesToRadians.
	_gsSqueakTemp_unitVector := _gsSqueakTemp_alphaRadians sin @ _gsSqueakTemp_alphaRadians cos negated.
	shaft setVertices: {_gsSqueakTemp_unitVector * 6 + directionArrowAnchor. _gsSqueakTemp_unitVector * self directionArrowLength + directionArrowAnchor}
	"6 = radius of deadeye circle"