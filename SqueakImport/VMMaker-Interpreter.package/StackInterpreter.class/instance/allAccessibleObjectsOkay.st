debug support
allAccessibleObjectsOkay
	"Ensure that all accessible objects in the heap are okay."

	| oop |
	oop := objectMemory firstAccessibleObject.
	[oop = nil] whileFalse: [
		self okayFields: oop.
		oop := objectMemory accessibleObjectAfter: oop.
	].