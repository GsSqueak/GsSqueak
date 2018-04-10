slot getters/setters
setBottom: w 
	"Set the bottom coordinate (cartesian sense) of the object as
	requested "
	| _gsSqueakTemp_topLeftNow _gsSqueakTemp_cost |
	_gsSqueakTemp_cost := self costume.
	_gsSqueakTemp_cost isWorldMorph
		ifTrue: [^ self].
	_gsSqueakTemp_topLeftNow := _gsSqueakTemp_cost cartesianBoundsTopLeft.
	^ _gsSqueakTemp_cost bottom: _gsSqueakTemp_cost top + _gsSqueakTemp_topLeftNow y - w