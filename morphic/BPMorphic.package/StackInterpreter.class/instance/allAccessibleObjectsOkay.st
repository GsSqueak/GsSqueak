debug support
allAccessibleObjectsOkay
	"Ensure that all accessible objects in the heap are okay."
	| _gsSqueakTemp_ok |
	_gsSqueakTemp_ok := true.
	objectMemory
		allObjectsDoSafely: [:oop | _gsSqueakTemp_ok := _gsSqueakTemp_ok
						& (self okayFields: oop)].
	^ _gsSqueakTemp_ok