utilities
setAsBackground: aFormOrColorOrFillStyle
	"Set  aForm as a background image."

	| thisWorld newFill oldFill |
	thisWorld := self currentWorld.
	
	oldFill := thisWorld fillStyle.
	thisWorld fillStyle: aFormOrColorOrFillStyle.
	newFill := thisWorld fillStyle.
	
	newFill rememberCommand:
		(Command new cmdWording: 'set background to a picture' translated;
			undoTarget: thisWorld selector: #fillStyle: argument: oldFill;
			redoTarget: thisWorld selector: #fillStyle: argument: newFill).
	
	thisWorld setProperty: #hasCustomBackground toValue: true.
