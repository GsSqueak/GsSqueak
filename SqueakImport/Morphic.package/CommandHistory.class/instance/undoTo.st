called from the ui
undoTo
	"Not yet functional, and not yet sent.  Allow the user to choose a point somewhere in the undo/redo tape, and undo his way to there.   Applicable only if infiniteUndo is set. "

	| anIndex commandList reply |
	(anIndex := self historyIndexOfLastCommand) = 0 ifTrue: [^ Beeper beep].
	commandList := history
		copyFrom:	((anIndex - 10) max: 1)
		to:			((anIndex + 10) min: history size).
	reply := UIManager default chooseFrom: (commandList collect: [:cmd | cmd cmdWording truncateWithElipsisTo: 20]) values: commandList title: 'undo or redo to...'.
	reply ifNotNil: [self inform: #deferred]

	"ActiveWorld commandHistory undoTo"
