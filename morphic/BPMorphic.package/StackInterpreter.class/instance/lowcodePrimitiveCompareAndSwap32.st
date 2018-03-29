inline primitive generated code
lowcodePrimitiveCompareAndSwap32
	"Lowcode instruction generator"
	| _gsSqueakTemp_newValue _gsSqueakTemp_check _gsSqueakTemp_oldValue _gsSqueakTemp_value |
	_gsSqueakTemp_newValue := self internalPopStackInt32.
	_gsSqueakTemp_oldValue := self internalPopStackInt32.
	_gsSqueakTemp_check := self internalPopStackPointer.
	self abort.
	self internalPushInt32: _gsSqueakTemp_value