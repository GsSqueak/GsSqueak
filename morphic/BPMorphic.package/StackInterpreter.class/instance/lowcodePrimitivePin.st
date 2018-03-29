inline primitive generated code
lowcodePrimitivePin
	"Lowcode instruction generator"
	| _gsSqueakTemp_object |
	_gsSqueakTemp_object := self internalPopStack.
	objectMemory pinObject: _gsSqueakTemp_object