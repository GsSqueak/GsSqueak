inline primitive generated code
lowcodePrimitiveLoadPointerFromMemory
	"Lowcode instruction generator"
	| _gsSqueakTemp_pointerResult _gsSqueakTemp_pointer |
	_gsSqueakTemp_pointer := self internalPopStackPointer.
	_gsSqueakTemp_pointerResult := self pointerAtPointer: _gsSqueakTemp_pointer.
	self internalPushPointer: _gsSqueakTemp_pointerResult