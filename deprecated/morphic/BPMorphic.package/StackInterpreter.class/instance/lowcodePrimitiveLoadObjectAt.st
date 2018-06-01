inline primitive generated code
lowcodePrimitiveLoadObjectAt
	"Lowcode instruction generator"
	| _gsSqueakTemp_fieldIndex _gsSqueakTemp_object _gsSqueakTemp_fieldValue |
	_gsSqueakTemp_fieldIndex := self internalPopStackInt32.
	_gsSqueakTemp_object := self internalPopStack.
	_gsSqueakTemp_fieldValue := objectMemory fetchPointer: _gsSqueakTemp_fieldIndex ofObject: _gsSqueakTemp_object.
	self internalPush: _gsSqueakTemp_fieldValue