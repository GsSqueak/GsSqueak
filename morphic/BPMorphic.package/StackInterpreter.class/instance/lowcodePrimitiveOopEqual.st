inline primitive generated code
lowcodePrimitiveOopEqual
	"Lowcode instruction generator"
	| _gsSqueakTemp_second _gsSqueakTemp_value _gsSqueakTemp_first |
	_gsSqueakTemp_second := self internalPopStack.
	_gsSqueakTemp_first := self internalPopStack.
	_gsSqueakTemp_value := _gsSqueakTemp_first = _gsSqueakTemp_second
				ifTrue: [1]
				ifFalse: [0].
	self internalPushInt32: _gsSqueakTemp_value