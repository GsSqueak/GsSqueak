*Morphic-MorphicExtras-Undo
rememberUndoableAction: actionBlock named: caption
	| cmd result |
	cmd := Command new cmdWording: caption.
	cmd undoTarget: self selector: #undoFromCapturedState: argument: self capturedState.
	result := actionBlock value.
	cmd redoTarget: self selector: #redoFromCapturedState: argument: self capturedState.
	self rememberCommand: cmd.
	^ result