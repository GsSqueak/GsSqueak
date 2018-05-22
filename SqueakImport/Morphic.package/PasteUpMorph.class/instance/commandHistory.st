undo
commandHistory
	"Return the command history for the receiver"
	^self isWorldMorph
		ifTrue:[worldState commandHistory]
		ifFalse:[super commandHistory]