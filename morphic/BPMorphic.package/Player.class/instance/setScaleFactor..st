slot getters/setters
setScaleFactor: aNumber 
	"Set the scale factor to be the given value"
	| _gsSqueakTemp_cost |
	_gsSqueakTemp_cost := self costume.
	_gsSqueakTemp_cost isWorldMorph
		ifTrue: [^ self].
	_gsSqueakTemp_cost
		scaleFactor: ((aNumber asFloat max: 0.1)
				min: 10.0)