*Morphic-MorphicExtras-Undo
undoFromCapturedState: st 
	"May be overridden in subclasses.  See also capturedState"

	self copyFrom: st
