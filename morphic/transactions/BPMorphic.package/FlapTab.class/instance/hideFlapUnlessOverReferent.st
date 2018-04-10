show & hide
hideFlapUnlessOverReferent
	"Hide the flap unless the mouse is over my referent."
	| _gsSqueakTemp_aWorld _gsSqueakTemp_where |
	(referent isInWorld
			and: [_gsSqueakTemp_where := self outermostWorldMorph activeHand lastEvent cursorPoint.
				referent bounds
					containsPoint: (referent globalPointToLocal: _gsSqueakTemp_where)])
		ifTrue: [^ self].
	(_gsSqueakTemp_aWorld := self world)
		ifNil: [^ self].
	"In case flap tabs just got hidden"
	self referent delete.
	_gsSqueakTemp_aWorld removeAccommodationForFlap: self.
	flapShowing := false.
	self isInWorld
		ifFalse: [self inboard
				ifTrue: [_gsSqueakTemp_aWorld addMorphFront: self]].
	self adjustPositionAfterHidingFlap