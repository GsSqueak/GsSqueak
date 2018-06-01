scroll timing
waitForDelay1: delay1 delay2: delay2 
	"Return true if an appropriate delay has passed since the last scroll
	operation. The delay decreases exponentially from delay1 to delay2."
	| _gsSqueakTemp_now _gsSqueakTemp_scrollDelay |
	timeOfLastScroll
		ifNil: [self resetTimer].
	"Only needed for old instances"
	_gsSqueakTemp_now := Time millisecondClockValue.
	(_gsSqueakTemp_scrollDelay := currentScrollDelay) isNil
		ifTrue: [_gsSqueakTemp_scrollDelay := delay1
			"initial delay"].
	currentScrollDelay := _gsSqueakTemp_scrollDelay * 9 // 10 max: delay2.
	"decrease the delay"
	timeOfLastScroll := _gsSqueakTemp_now.
	^ true