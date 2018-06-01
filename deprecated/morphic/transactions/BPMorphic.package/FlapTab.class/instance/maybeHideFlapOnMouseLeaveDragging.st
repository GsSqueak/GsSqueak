show & hide
maybeHideFlapOnMouseLeaveDragging
	| _gsSqueakTemp_aWorld |
	self hasHalo
		ifTrue: [^ self].
	referent isInWorld
		ifFalse: [^ self].
	(dragged
			or: [referent bounds containsPoint: self cursorPoint])
		ifTrue: [^ self].
	_gsSqueakTemp_aWorld := self world.
	referent privateDelete.
	"could make me worldless if I'm inboard"
	_gsSqueakTemp_aWorld
		ifNotNil: [_gsSqueakTemp_aWorld removeAccommodationForFlap: self].
	flapShowing := false.
	self isInWorld
		ifFalse: [_gsSqueakTemp_aWorld addMorphFront: self].
	self adjustPositionAfterHidingFlap