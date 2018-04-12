event handling
keyStroke: event 
	"Process keys 
	The model is allowed to preview all keystrokes. If it's not interested:
	specialKeys are things like up, down, etc. ALWAYS HANDLED 
	modifierKeys are regular characters either 1) accompanied with ctrl, 
	cmd or 2) any character if the list doesn't want to handle basic 
	keys (handlesBasicKeys returns false) 
	basicKeys are any characters"
	| _gsSqueakTemp_aChar _gsSqueakTemp_aSpecialKey |
	(self previewKeystroke: event)
		ifTrue: [^ self].
	_gsSqueakTemp_aChar := event keyCharacter.
	(_gsSqueakTemp_aSpecialKey := _gsSqueakTemp_aChar asciiValue) < 32
		ifTrue: [^ self specialKeyPressed: _gsSqueakTemp_aSpecialKey].
	(event anyModifierKeyPressed
			or: [self handlesBasicKeys not])
		ifTrue: [^ self modifierKeyPressed: _gsSqueakTemp_aChar].
	^ self basicKeyPressed: _gsSqueakTemp_aChar