*Morphic-MorphicExtras-Undo
rememberCommand: aCommand
	"Remember the given command for undo"
	Preferences useUndo ifFalse: [^ self]. "get out quickly"
	^ self commandHistory rememberCommand: aCommand