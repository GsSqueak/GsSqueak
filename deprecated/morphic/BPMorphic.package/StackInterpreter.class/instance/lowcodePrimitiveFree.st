inline primitive generated code
lowcodePrimitiveFree
	"Lowcode instruction generator"
	| _gsSqueakTemp_pointer |
	_gsSqueakTemp_pointer := self internalPopStackPointer.
	self free: _gsSqueakTemp_pointer