scripts-standard
turnToward: aPlayer 
	"Turn to face the given player, unless our positions coincide."
	| _gsSqueakTemp_aCostume _gsSqueakTemp_myPosition _gsSqueakTemp_itsPosition |
	(aPlayer == nil
			or: [aPlayer == self])
		ifTrue: [^ self].
	_gsSqueakTemp_aCostume := self costume.
	_gsSqueakTemp_aCostume isWorldMorph
		ifTrue: [^ self].
	(self overlaps: aPlayer)
		ifFalse: [(_gsSqueakTemp_myPosition := _gsSqueakTemp_aCostume referencePosition) = (_gsSqueakTemp_itsPosition := aPlayer costume referencePosition)
				ifFalse: ["avoid division by zero ;-("
					self
						setHeading: (_gsSqueakTemp_myPosition bearingToPoint: _gsSqueakTemp_itsPosition)]]