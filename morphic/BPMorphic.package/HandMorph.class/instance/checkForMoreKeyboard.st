event handling
checkForMoreKeyboard
	"Quick check for more keyboard activity -- Allows, eg, many characters
	to be accumulated into a single replacement during type-in."
	| _gsSqueakTemp_evtBuf |
	self flag: #arNote.
	"Will not work if we don't examine event queue in Sensor"
	_gsSqueakTemp_evtBuf := Sensor peekKeyboardEvent.
	_gsSqueakTemp_evtBuf
		ifNil: [^ nil].
	^ self generateKeyboardEvent: _gsSqueakTemp_evtBuf