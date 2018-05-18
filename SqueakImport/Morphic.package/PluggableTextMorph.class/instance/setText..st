model access
setText: aText

	textMorph newContents: aText.
	self hasUnacceptedEdits: false.
	self setScrollDeltas.	
	self changed. "Redraw the whole area. For example, it might not be necssary to draw the help text anymore."