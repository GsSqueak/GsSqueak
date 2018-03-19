slot getters/setters
setTop: w 
	"Set the top coordinate as indicated, using cartesian sense"
	| _gsSqueakTemp_topLeftNow _gsSqueakTemp_cost |
	_gsSqueakTemp_cost := self costume.
	_gsSqueakTemp_cost isWorldMorph
		ifTrue: [^ self].
	_gsSqueakTemp_topLeftNow := _gsSqueakTemp_cost cartesianBoundsTopLeft.
	^ _gsSqueakTemp_cost top: _gsSqueakTemp_cost top + _gsSqueakTemp_topLeftNow y - w