inline primitive generated code
lowcodePrimitiveStoreObjectField
	"Lowcode instruction generator"
	| _gsSqueakTemp_fieldIndex _gsSqueakTemp_object _gsSqueakTemp_value |
	_gsSqueakTemp_fieldIndex := extA.
	_gsSqueakTemp_value := self internalPopStack.
	_gsSqueakTemp_object := self internalPopStack.
	objectMemory
		storePointer: _gsSqueakTemp_fieldIndex
		ofObject: _gsSqueakTemp_object
		withValue: _gsSqueakTemp_value.
	extA := 0