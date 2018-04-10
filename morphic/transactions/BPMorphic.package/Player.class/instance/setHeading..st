slot getters/setters
setHeading: newHeading 
	"Set the heading as indicated"
	| _gsSqueakTemp_aCostume |
	_gsSqueakTemp_aCostume := self costume.
	_gsSqueakTemp_aCostume isWorldMorph
		ifTrue: [^ self].
	(newHeading closeTo: _gsSqueakTemp_aCostume heading)
		ifTrue: [^ self].
	_gsSqueakTemp_aCostume heading: newHeading.
	_gsSqueakTemp_aCostume := self costume.
	"in case we just got flexed for no apparent reason"
	(_gsSqueakTemp_aCostume isFlexMorph
			and: [_gsSqueakTemp_aCostume hasNoScaleOrRotation])
		ifTrue: [_gsSqueakTemp_aCostume removeFlexShell]