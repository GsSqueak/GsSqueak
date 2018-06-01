world menu
addUndoItemsTo: aWorldMenu 
	"Add undo-related items to the given menu. Will add zero, one or two
	items, depending on the settings of the #useUndo and #infiniteUndo
	preferences "
	Preferences useUndo
		ifFalse: [^ self].
	Preferences infiniteUndo
		ifTrue: [aWorldMenu
				addUpdating: #undoMenuWording
				target: self commandHistory
				action: #undoLastCommand.
			aWorldMenu
				addUpdating: #redoMenuWording
				target: self commandHistory
				action: #redoNextCommand.
			self flag: #deferred]
		ifFalse: [aWorldMenu
				addUpdating: #undoOrRedoMenuWording
				target: self commandHistory
				action: #undoOrRedoCommand].
	aWorldMenu addLine