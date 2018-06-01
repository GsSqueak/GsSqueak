menu
undoOrRedoMenuWording
	"Answer the wording to be used in a menu item offering undo/redo (i.e., the form used when the #infiniteUndo preference is false)"

	| pre |
	self assureLastCommandStillValid. 
	lastCommand ifNil: [^ 'can''t undo' translated].
	pre := lastCommand phase == #done
		ifTrue: ['undo' translated]
		ifFalse: ['redo' translated].
	^ pre, ' "', (lastCommand cmdWording truncateWithElipsisTo: 20), '" (z)'