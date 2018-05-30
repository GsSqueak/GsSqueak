menu commands
inspectKey
	"Create and schedule an Inspector on the receiver's model's currently selected key."

	selectionIndex >= self numberOfFixedFields ifTrue:
		[(keyArray at: selectionIndex - self numberOfFixedFields) inspect]