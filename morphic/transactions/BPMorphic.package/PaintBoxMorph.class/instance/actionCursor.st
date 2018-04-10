actions
actionCursor
	"Return the cursor to use with this painting action/tool. Offset of the
	form must be set."
	^ self
		cursorFor: action
		oldCursor: currentCursor
		currentNib: self getNib
		color: currentColor