frame access
makeBaseFrameFor: aContext 
	"<Integer>"
	"Marry aContext with the base frame of a new stack page. Build the
	base frame to reflect the context's state. Answer the new page."
	| _gsSqueakTemp_page _gsSqueakTemp_pointer _gsSqueakTemp_theMethod _gsSqueakTemp_theIP _gsSqueakTemp_numArgs _gsSqueakTemp_stackPtrIndex _gsSqueakTemp_maybeClosure _gsSqueakTemp_rcvr |
	self
		assert: (objectMemory isContext: aContext).
	self
		assert: (self isSingleContext: aContext).
	self
		assert: (objectMemory goodContextSize: aContext).
	_gsSqueakTemp_page := stackPages newStackPage.
	_gsSqueakTemp_pointer := _gsSqueakTemp_page baseAddress.
	_gsSqueakTemp_theIP := objectMemory fetchPointer: InstructionPointerIndex ofObject: aContext.
	_gsSqueakTemp_theMethod := objectMemory followObjField: MethodIndex ofObject: aContext.
	(objectMemory isIntegerObject: _gsSqueakTemp_theIP)
		ifFalse: [self error: 'context is not resumable'].
	_gsSqueakTemp_theIP := objectMemory integerValueOf: _gsSqueakTemp_theIP.
	_gsSqueakTemp_rcvr := objectMemory followField: ReceiverIndex ofObject: aContext.
	"If the frame is a closure activation then the closure should be on the
	stack in
	the pushed receiver position (closures receive the value[:value:]
	messages). Otherwise it should be the receiver proper."
	_gsSqueakTemp_maybeClosure := objectMemory fetchPointer: ClosureIndex ofObject: aContext.
	_gsSqueakTemp_maybeClosure ~= objectMemory nilObject
		ifTrue: [(objectMemory isForwarded: _gsSqueakTemp_maybeClosure)
				ifTrue: [_gsSqueakTemp_maybeClosure := objectMemory
								fixFollowedField: ClosureIndex
								ofObject: aContext
								withInitialValue: _gsSqueakTemp_maybeClosure].
			_gsSqueakTemp_numArgs := self argumentCountOfClosure: _gsSqueakTemp_maybeClosure.
			stackPages longAt: _gsSqueakTemp_pointer put: _gsSqueakTemp_maybeClosure]
		ifFalse: [| header |
			header := objectMemory methodHeaderOf: _gsSqueakTemp_theMethod.
			_gsSqueakTemp_numArgs := self argumentCountOfMethodHeader: header.
			"If this is a synthetic context its IP could be pointing at the
			CallPrimitive opcode. If so, skip it."
			((self methodHeaderHasPrimitive: header)
					and: [_gsSqueakTemp_theIP = (1
								+ (self startPCOfMethodHeader: header))])
				ifTrue: [_gsSqueakTemp_theIP := _gsSqueakTemp_theIP
								+ (self sizeOfCallPrimitiveBytecode: header)].
			stackPages longAt: _gsSqueakTemp_pointer put: _gsSqueakTemp_rcvr].
	"Put the arguments on the stack"
	1
		to: _gsSqueakTemp_numArgs
		do: [:i | stackPages
				longAt: (_gsSqueakTemp_pointer := _gsSqueakTemp_pointer - objectMemory wordSize)
				put: (objectMemory fetchPointer: ReceiverIndex + i ofObject: aContext)].
	"saved caller ip is sender context in base frame"
	stackPages
		longAt: (_gsSqueakTemp_pointer := _gsSqueakTemp_pointer - objectMemory wordSize)
		put: (objectMemory followObjField: SenderIndex ofObject: aContext).
	"base frame's saved fp is null"
	stackPages longAt: (_gsSqueakTemp_pointer := _gsSqueakTemp_pointer - objectMemory wordSize) put: 0.
	_gsSqueakTemp_page baseFP: _gsSqueakTemp_pointer;
		 headFP: _gsSqueakTemp_pointer.
	stackPages longAt: (_gsSqueakTemp_pointer := _gsSqueakTemp_pointer - objectMemory wordSize) put: _gsSqueakTemp_theMethod.
	stackPages
		longAt: (_gsSqueakTemp_pointer := _gsSqueakTemp_pointer - objectMemory wordSize)
		put: (self
				encodeFrameFieldHasContext: true
				isBlock: _gsSqueakTemp_maybeClosure ~= objectMemory nilObject
				numArgs: _gsSqueakTemp_numArgs).
	self
		assert: (self frameHasContext: _gsSqueakTemp_page baseFP).
	self assert: (self frameNumArgs: _gsSqueakTemp_page baseFP)
			== _gsSqueakTemp_numArgs.
	stackPages longAt: (_gsSqueakTemp_pointer := _gsSqueakTemp_pointer - objectMemory wordSize) put: aContext.
	stackPages longAt: (_gsSqueakTemp_pointer := _gsSqueakTemp_pointer - objectMemory wordSize) put: _gsSqueakTemp_rcvr.
	_gsSqueakTemp_stackPtrIndex := self quickFetchInteger: StackPointerIndex ofObject: aContext.
	self assert: ReceiverIndex + _gsSqueakTemp_stackPtrIndex
			< (objectMemory lengthOf: aContext).
	_gsSqueakTemp_numArgs + 1
		to: _gsSqueakTemp_stackPtrIndex
		do: [:i | stackPages
				longAt: (_gsSqueakTemp_pointer := _gsSqueakTemp_pointer - objectMemory wordSize)
				put: (objectMemory fetchPointer: ReceiverIndex + i ofObject: aContext)].
	"top of stack is the instruction pointer"
	_gsSqueakTemp_theIP := self iframeInstructionPointerForIndex: _gsSqueakTemp_theIP method: _gsSqueakTemp_theMethod.
	stackPages longAt: (_gsSqueakTemp_pointer := _gsSqueakTemp_pointer - objectMemory wordSize) put: _gsSqueakTemp_theIP.
	_gsSqueakTemp_page headSP: _gsSqueakTemp_pointer.
	self
		assert: (self
				context: aContext
				hasValidInversePCMappingOf: _gsSqueakTemp_theIP
				in: _gsSqueakTemp_page baseFP).
	"Mark context as married by setting its sender to the frame pointer
	plus SmallInteger
	tags and the InstructionPointer to the saved fp (which ensures
	correct alignment
	w.r.t. the frame when we check for validity) plus SmallInteger tags."
	objectMemory
		storePointerUnchecked: SenderIndex
		ofObject: aContext
		withValue: (self withSmallIntegerTags: _gsSqueakTemp_page baseFP).
	objectMemory
		storePointerUnchecked: InstructionPointerIndex
		ofObject: aContext
		withValue: (self withSmallIntegerTags: 0).
	self
		assert: (objectMemory
				isIntegerObject: (objectMemory fetchPointer: SenderIndex ofObject: aContext)).
	self assert: (self frameOfMarriedContext: aContext)
			= _gsSqueakTemp_page baseFP.
	self
		assert: (self validStackPageBaseFrame: _gsSqueakTemp_page).
	^ _gsSqueakTemp_page