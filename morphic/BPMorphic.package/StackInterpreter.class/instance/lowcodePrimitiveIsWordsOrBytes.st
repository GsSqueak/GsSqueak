inline primitive generated code
lowcodePrimitiveIsWordsOrBytes
	"Lowcode instruction generator"
	| _gsSqueakTemp_object _gsSqueakTemp_value |
	_gsSqueakTemp_object := self internalPopStack.
	_gsSqueakTemp_value := (objectMemory isWordsOrBytes: _gsSqueakTemp_object)
				ifTrue: [1]
				ifFalse: [0].
	self internalPushInt32: _gsSqueakTemp_value