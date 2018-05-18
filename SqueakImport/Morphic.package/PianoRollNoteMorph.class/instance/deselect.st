selecting
deselect

	selected ifFalse: [^ self].
	self changed.
	selected := false.
