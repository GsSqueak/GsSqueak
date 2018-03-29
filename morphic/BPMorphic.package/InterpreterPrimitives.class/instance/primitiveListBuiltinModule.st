plugin primitives
primitiveListBuiltinModule
	"Primitive. Return the n-th builtin module name."
	| _gsSqueakTemp_moduleName _gsSqueakTemp_index _gsSqueakTemp_length _gsSqueakTemp_nameOop |
	self methodArgumentCount = 1
		ifFalse: [^ self primitiveFail].
	_gsSqueakTemp_index := self stackIntegerValue: 0.
	_gsSqueakTemp_index <= 0
		ifTrue: [^ self primitiveFail].
	_gsSqueakTemp_moduleName := self ioListBuiltinModule: _gsSqueakTemp_index.
	_gsSqueakTemp_moduleName == nil
		ifTrue: [self pop: 2.
			"arg+rcvr"
			^ self push: objectMemory nilObject].
	_gsSqueakTemp_length := self strlen: _gsSqueakTemp_moduleName.
	_gsSqueakTemp_nameOop := objectMemory instantiateClass: objectMemory classString indexableSize: _gsSqueakTemp_length.
	0
		to: _gsSqueakTemp_length - 1
		do: [:i | objectMemory
				storeByte: i
				ofObject: _gsSqueakTemp_nameOop
				withValue: (_gsSqueakTemp_moduleName at: i)].
	self forceInterruptCheck.
	self pop: 2 thenPush: _gsSqueakTemp_nameOop