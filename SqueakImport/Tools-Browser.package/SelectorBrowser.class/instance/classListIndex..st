class list
classListIndex: anInteger

	classListIndex := anInteger.
	classListIndex > 0 ifTrue:
		[self changed: #startNewBrowser. "MVC view will terminate control to prepare for new browser"
		ToolSet browse: self selectedClass selector: self selectedMessageName.
		"classListIndex := 0"]
