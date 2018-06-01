*Morphic-MorphicExtras-accessing
dragIfAuthoring: evt
	"Allow simple dragging if the class var is set to my owner."
	owner == AuthorModeOwner ifTrue: [
		self center: evt cursorPoint].
	^ owner == AuthorModeOwner