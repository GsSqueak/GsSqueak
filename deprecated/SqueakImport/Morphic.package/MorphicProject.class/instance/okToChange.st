release
okToChange
	"If the view is from somewhere else than the current project, just delete it."
	
	^ self parent ~~ Project current
		or: [super okToChange]