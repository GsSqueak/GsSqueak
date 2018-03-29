inline primitive generated code
lowcodePrimitiveLoadObjectField
	"Lowcode instruction generator"
	| _gsSqueakTemp_fieldIndex _gsSqueakTemp_object _gsSqueakTemp_fieldValue |
	_gsSqueakTemp_fieldIndex := extA.
	_gsSqueakTemp_object := self internalPopStack.
	_gsSqueakTemp_fieldValue := self fetchPointer: _gsSqueakTemp_fieldIndex ofObject: _gsSqueakTemp_object.
	self internalPush: _gsSqueakTemp_fieldValue.
	extA := 0