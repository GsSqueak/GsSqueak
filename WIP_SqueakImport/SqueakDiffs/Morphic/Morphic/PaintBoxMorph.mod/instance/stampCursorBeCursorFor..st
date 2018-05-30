actions
stampCursorBeCursorFor: anAction
	"User just chose a stamp.  Take that stamp picture and make it be the cursor for the tool named."
	"self stampCursorBeCursorFor: #star:.
	currentCursor offset: -9@-3.			Has side effect on the saved cursor."

	(self submorphNamed: anAction) arguments at: 3 put: currentCursor.
		"Already converted to 8 bits and in the right form"