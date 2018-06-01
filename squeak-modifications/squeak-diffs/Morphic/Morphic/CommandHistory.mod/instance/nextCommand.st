command history
nextCommand
	"Answer the command object that would be sent the #redoCommand message if the user were to request Redo, or nil if none"

	| anIndex |
	lastCommand ifNil: [^ nil].
	lastCommand phase == #undone ifTrue: [^ lastCommand].
	anIndex := history indexOf: lastCommand ifAbsent: [^ nil].
	^ anIndex = history size ifTrue: [nil] ifFalse: [history at: (anIndex + 1)]