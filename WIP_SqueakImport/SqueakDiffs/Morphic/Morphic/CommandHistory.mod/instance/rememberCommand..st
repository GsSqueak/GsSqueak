undo
rememberCommand: aCommand
	"Make the supplied command be the 'LastCommand', and mark it 'done'"

	| currentCommandIndex |
	Preferences useUndo ifFalse: [^ self].  "Command initialize"

	Preferences infiniteUndo ifTrue:
		[currentCommandIndex := history indexOf: lastCommand.
		((currentCommandIndex < history size) and: [Preferences preserveCommandExcursions]) ifTrue:
			[excursions add: (history copyFrom: (currentCommandIndex to: history size)).
			history := history copyFrom: 1 to: currentCommandIndex].
		history addLast: aCommand].

	lastCommand := aCommand.
	lastCommand phase: #done.