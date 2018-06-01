inline primitive generated code
lowcodePrimitiveUnpin
	"Lowcode instruction generator"
	| _gsSqueakTemp_object |
	_gsSqueakTemp_object := self internalPopStack.
	objectMemory unpinObject: _gsSqueakTemp_object