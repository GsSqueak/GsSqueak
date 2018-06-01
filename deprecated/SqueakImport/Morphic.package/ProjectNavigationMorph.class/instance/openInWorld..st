initialization
openInWorld: aWorld

	LastManualPlacement ifNotNil: [
		self position: LastManualPlacement first.
		self setProperty: #stickToTop toValue: LastManualPlacement second.
	].
	super openInWorld: aWorld.