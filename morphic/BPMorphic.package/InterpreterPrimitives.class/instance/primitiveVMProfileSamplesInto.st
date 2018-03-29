process primitives
primitiveVMProfileSamplesInto
	"Primitive.
	0 args: Answer whether the VM Profiler is running or not.
	1 arg:	Copy the sample data into the supplied argument, which must
	be a Bitmap
	of suitable size. Answer the number of samples copied into the buffer."
	| _gsSqueakTemp_sampleBuffer _gsSqueakTemp_running _gsSqueakTemp_bufferSize _gsSqueakTemp_numSamples |
	self
		ioNewProfile: (self
				addressOf: _gsSqueakTemp_running
				put: [:v | _gsSqueakTemp_running := v])
		Status: (self
				addressOf: _gsSqueakTemp_bufferSize
				put: [:v | _gsSqueakTemp_bufferSize := v]).
	argumentCount = 0
		ifTrue: [^ self pop: 1 thenPushBool: _gsSqueakTemp_running].
	argumentCount = 1
		ifFalse: [^ self primitiveFailFor: PrimErrBadNumArgs].
	_gsSqueakTemp_sampleBuffer := self stackValue: 0.
	((objectMemory isNonImmediate: _gsSqueakTemp_sampleBuffer)
			and: [(objectMemory isPureBitsNonImm: _gsSqueakTemp_sampleBuffer)
					and: [(objectMemory numBytesOf: _gsSqueakTemp_sampleBuffer)
							>= (_gsSqueakTemp_bufferSize * objectMemory wordSize)]])
		ifFalse: [^ self primitiveFailFor: PrimErrBadArgument].
	_gsSqueakTemp_numSamples := self
				ioNewProfileSamplesInto: (objectMemory firstFixedField: _gsSqueakTemp_sampleBuffer).
	self pop: argumentCount + 1 thenPushInteger: _gsSqueakTemp_numSamples