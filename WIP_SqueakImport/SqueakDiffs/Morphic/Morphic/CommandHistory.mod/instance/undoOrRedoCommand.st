called from the ui
undoOrRedoCommand
	"This gives a feature comparable to standard Mac undo/redo.  If the undo/redo action taken was a simple do or a redo, then undo it.  But if the last undo/redo action taken was an undo, then redo it."

	"Command undoOrRedoCommand"
	| aPhase |
	lastCommand ifNil: [^ Beeper beep].

	(aPhase := lastCommand phase) == #done
		ifTrue:
			[lastCommand undoCommand.
			lastCommand phase: #undone]
		ifFalse:
			[aPhase == #undone
				ifTrue:
					[lastCommand redoCommand.
					lastCommand phase: #done]]