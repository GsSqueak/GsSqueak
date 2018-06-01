inline primitive generated code
lowcodePrimitiveBoolean64ToOop
	"Lowcode instruction generator"
	| _gsSqueakTemp_object _gsSqueakTemp_value |
	_gsSqueakTemp_value := self internalPopStackInt64.
	_gsSqueakTemp_object := _gsSqueakTemp_value ~= 0
				ifTrue: [objectMemory trueObject]
				ifFalse: [objectMemory falseObject].
	self internalPush: _gsSqueakTemp_object