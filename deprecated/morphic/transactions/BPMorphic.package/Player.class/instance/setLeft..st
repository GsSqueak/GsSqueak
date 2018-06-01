slot getters/setters
setLeft: w 
	"Set the object's left coordinate as indicated"
	| _gsSqueakTemp_topLeftNow _gsSqueakTemp_cost |
	_gsSqueakTemp_cost := self costume.
	_gsSqueakTemp_cost isWorldMorph
		ifTrue: [^ self].
	_gsSqueakTemp_topLeftNow := _gsSqueakTemp_cost cartesianBoundsTopLeft.
	^ _gsSqueakTemp_cost left: _gsSqueakTemp_cost left - _gsSqueakTemp_topLeftNow x + w