parts bin
initializeToStandAlone
	super initializeToStandAlone.
	self removeEverything; pageSize: 360@228; color: Color white.
	self borderWidth: 1; borderColor: Color black.
	self beSticky.
	self showPageControls; insertPage.
	^ self