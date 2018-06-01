called from the ui
commandToUndo
	"Undo the last command, i.e. move backward in the recent-commands tape, if possible."

	| anIndex |
	lastCommand ifNil: [^ nil].
	lastCommand phase == #done ifTrue: [^ lastCommand].
	(lastCommand phase == #undone and:
		[(anIndex := history indexOf: lastCommand) > 1])
		ifTrue: [^ history at: anIndex - 1]
		ifFalse: [^ nil]
