inline primitive generated code
lowcodePrimitiveStoreFloat64ToMemory
	"Lowcode instruction generator"
	| _gsSqueakTemp_doubleValue _gsSqueakTemp_pointer |
	_gsSqueakTemp_pointer := self internalPopStackPointer.
	_gsSqueakTemp_doubleValue := self internalPopStackFloat64.
	self floatAtPointer: _gsSqueakTemp_pointer put: _gsSqueakTemp_doubleValue