support - misc
editAnnotations
	"Put up a window that allows the user to edit annotation specifications"

	| aWindow |
	self currentWorld addMorphCentered: (aWindow := self annotationEditingWindow).
	aWindow beKeyWindow.

	"Preferences editAnnotations"

