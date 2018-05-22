events
filterEvent: aKeyboardEvent for: anObject
	"Provide keyboard shortcuts."
		
	aKeyboardEvent isKeystroke
		ifFalse: [^ aKeyboardEvent].
	
	aKeyboardEvent commandKeyPressed ifTrue: [
		aKeyboardEvent keyCharacter caseOf: {
			[$\] -> [self class sendTopWindowToBack].
			[Character escape] -> [self class deleteTopWindow].
			[$/] -> [self class bringWindowUnderHandToFront].
		} otherwise: [^ aKeyboardEvent "no hit"].
		^ aKeyboardEvent ignore "hit!"].
	
	aKeyboardEvent controlKeyPressed ifTrue: [
		aKeyboardEvent keyCharacter caseOf: {
			[Character escape] -> [self world findWindow: aKeyboardEvent].
		} otherwise: [^ aKeyboardEvent "no hit"].
		^ aKeyboardEvent ignore "hit!"].

	^ aKeyboardEvent "no hit"