called from the ui
undoLastCommand
	"Undo the last command, i.e. move backward in the recent-commands tape, if possible."

	| aPhase anIndex |
	lastCommand ifNil: [^ Beeper beep].

	(aPhase := lastCommand phase) == #done
		ifFalse:
			[aPhase == #undone
				ifTrue:
					[anIndex := history indexOf: lastCommand.
					anIndex > 1 ifTrue:
						[lastCommand := history at: anIndex - 1]]].

	lastCommand undoCommand.
	lastCommand phase: #undone

	"Command undoLastCommand"
