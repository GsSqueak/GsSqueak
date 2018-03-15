undo/redo
beginRemember: command 
	commands := commands
				copyFrom: (1 max: currentIndex + 2 - self class maximumTextHistoryDepth)
				to: (currentIndex min: commands size).
	commands := commands , {command}.
	currentIndex := commands size - 1