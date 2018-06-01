stop conditions
tab
	| _gsSqueakTemp_nextDestX |
	_gsSqueakTemp_nextDestX := self plainTab.
	lastCharacterWidth := _gsSqueakTemp_nextDestX - destX max: 0.
	_gsSqueakTemp_nextDestX >= characterPoint x
		ifTrue: [^ self crossedX].
	destX := _gsSqueakTemp_nextDestX.
	lastIndex := lastIndex + 1.
	^ false