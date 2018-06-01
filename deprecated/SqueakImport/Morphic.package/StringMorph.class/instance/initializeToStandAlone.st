parts bin
initializeToStandAlone
	super initializeToStandAlone.
	
	font := nil.
	emphasis := 0.
	hasFocus := false.
	self contents: 'String: Shift-click on me to edit'