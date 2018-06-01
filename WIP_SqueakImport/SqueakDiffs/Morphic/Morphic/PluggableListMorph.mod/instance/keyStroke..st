event handling
keyStroke: event 
	"Process keys 
	The model is allowed to preview all keystrokes. If it's not interested:
	specialKeys are things like up, down, etc. ALWAYS HANDLED 
	modifierKeys are regular characters either 1) accompanied with ctrl, 
	cmd or 2) any character if the list doesn't want to handle basic 
	keys (handlesBasicKeys returns false) 
	basicKeys are any characters"
	
	| aChar aSpecialKey |
	(self previewKeystroke: event)
		ifTrue: [^ self].
	
	aChar := event keyCharacter.
	
	(aSpecialKey := aChar asciiValue) < 32
		ifTrue: [^ self specialKeyPressed: aSpecialKey].
	
	(event anyModifierKeyPressed or: [self handlesBasicKeys not])
		ifTrue: [^ self modifierKeyPressed: aChar].
		
	^ self basicKeyPressed: aChar