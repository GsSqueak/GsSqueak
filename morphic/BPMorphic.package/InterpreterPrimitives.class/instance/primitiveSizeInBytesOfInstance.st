memory space primitives
primitiveSizeInBytesOfInstance
	"Answer the byte size of an instance of the receiver. If num args > 0
	then the last argument is a variable size and the size answered is the
	size of an instance of the receiver with that many indexable elements."
	| _gsSqueakTemp_byteSize _gsSqueakTemp_err |
	NewspeakVM
		ifTrue: ["Support
			VMMirror>>byteSizeOfInstanceOf:WithIndexableVariables: "
			argumentCount > 2
				ifTrue: [^ self primitiveFailFor: PrimErrBadNumArgs]]
		ifFalse: [argumentCount > 1
				ifTrue: [^ self primitiveFailFor: PrimErrBadNumArgs]].
	_gsSqueakTemp_err := -1.
	argumentCount >= 1
		ifTrue: [(objectMemory isIntegerObject: self stackTop)
				ifFalse: [^ self primitiveFailFor: PrimErrBadArgument].
			_gsSqueakTemp_byteSize := objectMemory
						byteSizeOfInstanceOf: (self stackValue: 1)
						withIndexableSlots: (objectMemory integerValueOf: self stackTop)
						errInto: [:code | _gsSqueakTemp_err := code].
			_gsSqueakTemp_err >= 0
				ifTrue: [^ self primitiveFailFor: _gsSqueakTemp_err].
			^ self
				pop: argumentCount + 1
				thenPush: (self positive64BitIntegerFor: _gsSqueakTemp_byteSize)].
	_gsSqueakTemp_byteSize := objectMemory
				byteSizeOfInstanceOf: (self stackValue: 0)
				errInto: [:code | _gsSqueakTemp_err := code].
	_gsSqueakTemp_err >= 0
		ifTrue: [^ self primitiveFailFor: _gsSqueakTemp_err].
	self pop: 1 thenPushInteger: _gsSqueakTemp_byteSize