slot getters/setters
setDistance: aDistance 
	"Set the object's distance from the origin to be as indicated,
	preserving its angle."
	| _gsSqueakTemp_cost |
	_gsSqueakTemp_cost := self costume.
	_gsSqueakTemp_cost isWorldMorph
		ifTrue: [^ self].
	_gsSqueakTemp_cost
		cartesianXY: (Point r: aDistance degrees: self getTheta)