utilities
fetchInteger: fieldIndex ofObject: objectPointer 
	"Note: May be called by translated primitive code."
	| _gsSqueakTemp_intOop |
	_gsSqueakTemp_intOop := objectMemory fetchPointer: fieldIndex ofObject: objectPointer.
	^ self checkedIntegerValueOf: _gsSqueakTemp_intOop