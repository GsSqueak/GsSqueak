slot getters/setters
setTheta: aTheta 
	"Set the object's position such that its rho is unchanged but the angle
	between the positive x-axis and the vector connecting the origin and
	the object's position is as given."
	| _gsSqueakTemp_cost |
	_gsSqueakTemp_cost := self costume.
	_gsSqueakTemp_cost isWorldMorph
		ifTrue: [^ self].
	_gsSqueakTemp_cost
		cartesianXY: (Point r: self getDistance degrees: aTheta)