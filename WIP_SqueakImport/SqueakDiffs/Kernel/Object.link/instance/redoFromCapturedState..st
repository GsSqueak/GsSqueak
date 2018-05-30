*Morphic-MorphicExtras-Undo
redoFromCapturedState: st 
	"May be overridden in subclasses.  See also capturedState"

	self undoFromCapturedState: st  "Simple cases are symmetric"
