private actions
toggleMessageSelectionAt: anInteger

	messageSelections 
		at: anInteger 
		put: (messageSelections at: anInteger) not
