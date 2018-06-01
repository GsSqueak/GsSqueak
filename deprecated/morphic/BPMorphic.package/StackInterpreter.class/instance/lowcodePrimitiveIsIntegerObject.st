inline primitive generated code
lowcodePrimitiveIsIntegerObject
	"Lowcode instruction generator"
	| _gsSqueakTemp_object _gsSqueakTemp_value |
	_gsSqueakTemp_object := self internalPopStack.
	_gsSqueakTemp_value := (objectMemory isIntegerObject: _gsSqueakTemp_object)
				ifTrue: [1]
				ifFalse: [0].
	self internalPushInt32: _gsSqueakTemp_value