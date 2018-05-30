called by programmer
purgeAllCommandsSuchThat: cmdBlock 
	"Remove a bunch of commands, as in [:cmd | cmd undoTarget == zort]"

	Preferences useUndo ifFalse: [^self].
	history := history reject: cmdBlock.
	lastCommand := history isEmpty ifTrue: [nil] ifFalse: [history last] 