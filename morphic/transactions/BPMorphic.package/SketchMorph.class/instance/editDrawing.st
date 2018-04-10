menu
editDrawing
	self flag: #deferred.
	"Don't allow this if the user is already in paint mode, because it creates
	a very strange situation."
	"costumee ifNotNil: [self forwardDirection: costumee direction]."
	"how say this?"
	self editDrawingIn: self pasteUpMorph forBackground: false