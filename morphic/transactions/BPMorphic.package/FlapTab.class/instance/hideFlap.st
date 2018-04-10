show & hide
hideFlap
	| _gsSqueakTemp_aWorld |
	_gsSqueakTemp_aWorld := self world
				ifNil: [self currentWorld].
	referent privateDelete.
	_gsSqueakTemp_aWorld removeAccommodationForFlap: self.
	flapShowing := false.
	self isInWorld
		ifFalse: [_gsSqueakTemp_aWorld addMorphFront: self].
	self adjustPositionAfterHidingFlap.
	_gsSqueakTemp_aWorld haloMorphs
		do: [:m | m target isInWorld
				ifFalse: [m delete]]