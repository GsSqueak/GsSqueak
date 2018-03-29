process primitives
primitiveControlVMProfiling
	"Primitive. Start or stop the VM profiler. The first argument is a boolean
	to switch profiling on or off. The second argument is an integer or nil.
	If an integer it determines the maximum number of samples in the
	VM's sample buffer. Answer the current number of samples in the
	buffer. "
	| _gsSqueakTemp_onOffBar _gsSqueakTemp_bufferSize _gsSqueakTemp_numSamples |
	argumentCount ~= 2
		ifTrue: [^ self primitiveFail].
	(_gsSqueakTemp_onOffBar := self stackValue: 1) = objectMemory trueObject
		ifTrue: [_gsSqueakTemp_onOffBar := 1]
		ifFalse: [_gsSqueakTemp_onOffBar = objectMemory falseObject
				ifTrue: [_gsSqueakTemp_onOffBar := 0]
				ifFalse: [^ self primitiveFail]].
	(_gsSqueakTemp_bufferSize := self stackTop) = objectMemory nilObject
		ifTrue: [_gsSqueakTemp_bufferSize := 0]
		ifFalse: [((objectMemory isIntegerObject: _gsSqueakTemp_bufferSize)
					and: [(_gsSqueakTemp_bufferSize := objectMemory integerValueOf: _gsSqueakTemp_bufferSize) > 0])
				ifFalse: [^ self primitiveFail]].
	_gsSqueakTemp_numSamples := self cCode: 'ioControlNewProfile(onOffBar,bufferSize)'.
	self pop: 3 thenPushInteger: _gsSqueakTemp_numSamples