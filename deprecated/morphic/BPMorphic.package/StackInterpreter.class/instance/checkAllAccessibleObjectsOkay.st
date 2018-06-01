debug support
checkAllAccessibleObjectsOkay
	"Ensure that all accessible objects in the heap are okay."
	| _gsSqueakTemp_ok |
	_gsSqueakTemp_ok := true.
	objectMemory
		allObjectsDoSafely: [:oop | _gsSqueakTemp_ok := _gsSqueakTemp_ok
						& (self checkOkayFields: oop)].
	^ _gsSqueakTemp_ok