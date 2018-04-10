scripts-standard
moveToward: aPlayer 
	"Move a standard amount in the direction of the given player. If the
	object has an instance variable named 'speed', the speed of the
	motion will be governed by that value"
	| _gsSqueakTemp_myPosition _gsSqueakTemp_itsPosition |
	(aPlayer ~~ self
			and: [(self overlaps: aPlayer) not])
		ifTrue: [(_gsSqueakTemp_myPosition := self costume referencePosition) = (_gsSqueakTemp_itsPosition := aPlayer costume referencePosition)
				ifFalse: [self
						setHeading: (_gsSqueakTemp_myPosition bearingToPoint: _gsSqueakTemp_itsPosition).
					self forward: self getSpeed]]