show & hide
hideFlapUnlessOverReferent
	"Hide the flap unless the mouse is over my referent."

	| aWorld where |
	(referent isInWorld and: 
		[where := self outermostWorldMorph activeHand lastEvent cursorPoint.
			referent bounds containsPoint: (referent globalPointToLocal: where)])
				ifTrue: [^ self].
	(aWorld := self world) ifNil: [^ self].  "In case flap tabs just got hidden"
	self referent delete.
	aWorld removeAccommodationForFlap: self.
	flapShowing := false.
	self isInWorld ifFalse:
		[self inboard ifTrue: [aWorld addMorphFront: self]].
	self adjustPositionAfterHidingFlap