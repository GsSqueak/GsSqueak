actions & preps
restoreRect: oldRect
	"Restore the given rectangular area of the painting Form from the undo buffer."

	formCanvas drawImage: undoBuffer
		at: oldRect origin
		sourceRect: (oldRect translateBy: self topLeft negated).
	self invalidRect: oldRect.
