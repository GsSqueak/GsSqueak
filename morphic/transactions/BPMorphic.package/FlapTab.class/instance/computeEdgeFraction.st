edge
computeEdgeFraction
	"Compute and remember the edge fraction"
	| _gsSqueakTemp_aBox _gsSqueakTemp_aFraction |
	self isCurrentlySolid
		ifTrue: [^ edgeFraction
				ifNil: [self edgeFraction: 0.5]].
	_gsSqueakTemp_aBox := (self pasteUpMorph
				ifNil: [self currentWorld]) bounds insetBy: self extent // 2.
	_gsSqueakTemp_aFraction := self
				ifVertical: [self center y - _gsSqueakTemp_aBox top
						/ (_gsSqueakTemp_aBox height max: 1)]
				ifHorizontal: [self center x - _gsSqueakTemp_aBox left
						/ (_gsSqueakTemp_aBox width max: 1)].
	^ self edgeFraction: _gsSqueakTemp_aFraction