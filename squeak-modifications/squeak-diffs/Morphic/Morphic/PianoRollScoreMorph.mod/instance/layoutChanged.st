layout
layoutChanged
	"Override this to avoid propagating 'layoutChanged' when just adding/removing note objects."

	fullBounds = bounds ifTrue: [^ self].
	super layoutChanged.
