undo
commandHistory
	^ commandHistory
		ifNil: [commandHistory := CommandHistory new]