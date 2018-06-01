slot getters/setters
getLength
	"Answer the length of the object"
	| _gsSqueakTemp_aLength _gsSqueakTemp_cost |
	(_gsSqueakTemp_cost := self costume) isLineMorph
		ifTrue: ["annoying special case"
			^ _gsSqueakTemp_cost unrotatedLength].
	_gsSqueakTemp_aLength := _gsSqueakTemp_cost renderedMorph height.
	"facing upward when unrotated"
	_gsSqueakTemp_cost isRenderer
		ifTrue: [_gsSqueakTemp_aLength := _gsSqueakTemp_aLength * _gsSqueakTemp_cost scaleFactor].
	^ _gsSqueakTemp_aLength