menu
nextCommandToUndo
	| anIndex |
	lastCommand ifNil: [^ nil].
	lastCommand phase == #done ifTrue: [^ lastCommand].
	(lastCommand phase == #undone and:
		[(anIndex := history indexOf: lastCommand) > 1])
		ifTrue: [^ history at: anIndex - 1]
		ifFalse: [^ nil]