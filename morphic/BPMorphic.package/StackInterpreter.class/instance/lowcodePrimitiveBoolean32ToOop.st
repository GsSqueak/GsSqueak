inline primitive generated code
lowcodePrimitiveBoolean32ToOop
	"Lowcode instruction generator"
	| _gsSqueakTemp_object _gsSqueakTemp_value |
	_gsSqueakTemp_value := self internalPopStackInt32.
	_gsSqueakTemp_object := _gsSqueakTemp_value ~= 0
				ifTrue: [objectMemory trueObject]
				ifFalse: [objectMemory falseObject].
	self internalPush: _gsSqueakTemp_object