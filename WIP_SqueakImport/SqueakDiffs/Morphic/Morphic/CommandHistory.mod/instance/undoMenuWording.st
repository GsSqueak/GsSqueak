menu
undoMenuWording
	"Answer the wording to be used in an 'undo' menu item"

	(lastCommand isNil
			or: [Preferences useUndo not
			or: [(Preferences infiniteUndo not and: [lastCommand phase == #undone])
			or: [self nextCommandToUndo isNil]]])
		ifTrue: [^ 'can''t undo' translated].

	^ String
		streamContents: [:aStream | 
			aStream nextPutAll: 'undo' translated.
			aStream nextPutAll: ' "'.
			aStream nextPutAll: (self nextCommandToUndo cmdWording truncateWithElipsisTo: 20).
			aStream nextPut: $".
			lastCommand phase == #done
				ifTrue: [aStream nextPutAll: ' (z)']].