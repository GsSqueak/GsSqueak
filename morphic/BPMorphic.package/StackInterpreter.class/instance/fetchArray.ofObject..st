utilities
fetchArray: fieldIndex ofObject: objectPointer 
	"Fetch the instance variable at the given index of the given object.
	Return the address of first indexable field of resulting array object, or
	fail if the instance variable does not contain an indexable bytes or
	words object."
	"Note: May be called by translated primitive code."
	| _gsSqueakTemp_arrayOop |
	_gsSqueakTemp_arrayOop := objectMemory fetchPointer: fieldIndex ofObject: objectPointer.
	^ self arrayValueOf: _gsSqueakTemp_arrayOop