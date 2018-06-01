I/O primitives
primitiveGetNextEvent
	"Primitive. Return the next input event from the VM event queue."
	| _gsSqueakTemp_evtBuf _gsSqueakTemp_arg _gsSqueakTemp_value _gsSqueakTemp_eventTypeIs |
	self
		cCode: []
		inSmalltalk: [_gsSqueakTemp_evtBuf := objectMemory newInputEventAccessorOfSize: 8].
	_gsSqueakTemp_arg := self stackTop.
	((objectMemory isArray: _gsSqueakTemp_arg)
			and: [(objectMemory slotSizeOf: _gsSqueakTemp_arg)
					= 8])
		ifFalse: [^ self primitiveFailFor: PrimErrBadArgument].
	self
		ioGetNextEvent: (self cCoerce: _gsSqueakTemp_evtBuf to: 'sqInputEvent*').
	self successful
		ifFalse: [^ nil].
	"Event type"
	_gsSqueakTemp_eventTypeIs := _gsSqueakTemp_evtBuf at: 0.
	self
		storeInteger: 0
		ofObject: _gsSqueakTemp_arg
		withValue: (_gsSqueakTemp_evtBuf at: 0).
	self successful
		ifFalse: [^ nil].
	_gsSqueakTemp_eventTypeIs = 6
		ifTrue: ["Event is Complex, assume evtBuf is populated correctly and
			return "
			1
				to: 7
				do: [:i | 
					_gsSqueakTemp_value := _gsSqueakTemp_evtBuf at: i.
					self
						storePointer: i
						ofObject: _gsSqueakTemp_arg
						withValue: _gsSqueakTemp_value]]
		ifFalse: ["Event time stamp"
			self
				storeInteger: 1
				ofObject: _gsSqueakTemp_arg
				withValue: ((_gsSqueakTemp_evtBuf at: 1)
						bitAnd: MillisecondClockMask).
			self successful
				ifFalse: [^ nil].
			"Event arguments"
			2
				to: 7
				do: [:i | 
					_gsSqueakTemp_value := _gsSqueakTemp_evtBuf at: i.
					(objectMemory isIntegerValue: _gsSqueakTemp_value)
						ifTrue: [self
								storeInteger: i
								ofObject: _gsSqueakTemp_arg
								withValue: _gsSqueakTemp_value]
						ifFalse: [_gsSqueakTemp_value := self positiveMachineIntegerFor: _gsSqueakTemp_value.
							objectMemory
								storePointer: i
								ofObject: _gsSqueakTemp_arg
								withValue: _gsSqueakTemp_value]]].
	self successful
		ifTrue: [self pop: 1]