slot getters/setters
getWidth
	"Answer the width of the object"
	| _gsSqueakTemp_aWidth _gsSqueakTemp_cost |
	(_gsSqueakTemp_cost := self costume) isLineMorph
		ifTrue: ["annoying special case"
			^ _gsSqueakTemp_cost unrotatedWidth].
	_gsSqueakTemp_aWidth := _gsSqueakTemp_cost renderedMorph width.
	"facing upward when unrotated"
	_gsSqueakTemp_cost isRenderer
		ifTrue: [_gsSqueakTemp_aWidth := _gsSqueakTemp_aWidth * _gsSqueakTemp_cost scaleFactor].
	^ _gsSqueakTemp_aWidth