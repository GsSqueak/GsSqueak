typing/selecting keys
backspace: aKeyboardEvent 
	"Backspace over the last character."
	| _gsSqueakTemp_startIndex |
	aKeyboardEvent shiftPressed
		ifTrue: [^ self backWord: aKeyboardEvent].
	_gsSqueakTemp_startIndex := self markIndex
				+ (self hasCaret
						ifTrue: [0]
						ifFalse: [1]).
	_gsSqueakTemp_startIndex := 1 max: _gsSqueakTemp_startIndex - 1.
	^ self backTo: _gsSqueakTemp_startIndex