show & hide
maybeHideFlapOnMouseLeaveDragging
	| aWorld |
	self hasHalo ifTrue: [^ self].
	referent isInWorld ifFalse: [^ self].
	(dragged or: [referent bounds containsPoint: self cursorPoint])
		ifTrue:	[^ self].
	aWorld := self world.
	referent privateDelete.  "could make me worldless if I'm inboard"
	aWorld ifNotNil: [aWorld removeAccommodationForFlap: self].
	flapShowing := false.
	self isInWorld ifFalse: [aWorld addMorphFront: self].
	self adjustPositionAfterHidingFlap