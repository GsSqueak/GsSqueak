*Morphic-MorphicExtras-Undo
purgeAllCommands
	"Purge all commands for this object"
	Preferences useUndo ifFalse: [^ self]. "get out quickly"
	self commandHistory purgeAllCommandsSuchThat: [:cmd | cmd undoTarget == self].
