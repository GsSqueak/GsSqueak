the buttons
buttonUndo
	"Build and return a fresh Undo button for me."

	^ self makeUpdatingButtonWithBalloonText:  'Undo or redo the last undoable action' actionSelector: #undoOrRedoLastCommand wordingSelector: #undoButtonWording

