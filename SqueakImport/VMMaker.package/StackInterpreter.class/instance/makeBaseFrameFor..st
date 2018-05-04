frame access
makeBaseFrameFor: aContext "<Integer>"
	"Marry aContext with the base frame of a new stack page.  Build
	 the base frame to reflect the context's state.  Answer the new page."
	| page pointer theMethod numArgs stackPtrIndex maybeClosure |
	<inline: false>
	<var: #page type: #'StackPage *'>
	<var: #pointer type: #'char *'>
	<returnTypeC: 'StackPage *'>
	self assert: (self isSingleContext: aContext).
	page := self newStackPage.
	pointer := page baseAddress.
	theMethod := objectMemory fetchPointer: MethodIndex ofObject: aContext.
	"If the frame is a closure activation then the closure should be on the stack in
	 the pushed receiver position (closures receiver the value[:value:] messages).
	 Otherwise it should be the receiver proper."
	maybeClosure := (objectMemory fetchPointer: ClosureIndex ofObject: aContext).
	maybeClosure ~= objectMemory nilObject
		ifTrue: [numArgs := self argumentCountOfClosure: maybeClosure.
			 stackPages longAt: pointer put: maybeClosure]
		ifFalse:
			[numArgs := self argumentCountOf: theMethod.
			 stackPages longAt: pointer put: (objectMemory fetchPointer: ReceiverIndex ofObject: aContext)].
	"Put the arguments on the stack"
	1 to: numArgs do:
		[:i|
		stackPages
			longAt: (pointer := pointer - objectMemory bytesPerWord)
			put: (objectMemory fetchPointer: ReceiverIndex + i ofObject: aContext)].
	"saved caller ip is sender context in base frame"
	stackPages
		longAt: (pointer := pointer - objectMemory bytesPerWord)
		put: (objectMemory fetchPointer: SenderIndex ofObject: aContext).
	"base frame's saved fp is null"
	stackPages
		longAt: (pointer := pointer - objectMemory bytesPerWord)
		put: 0.
	page setBaseFP: pointer; setHeadFP: pointer.
	stackPages
		longAt: (pointer := pointer - objectMemory bytesPerWord)
		put: theMethod.
	stackPages
		longAt: (pointer := pointer - objectMemory bytesPerWord)
		put: (self encodeFrameFieldHasContext: true isBlock: maybeClosure ~= objectMemory nilObject numArgs: numArgs).
	self assert: (self frameHasContext: page baseFP).
	self assert: (self frameNumArgs: page baseFP) == numArgs.
	stackPages
		longAt: (pointer := pointer - objectMemory bytesPerWord)
		put: aContext.
	stackPages
		longAt: (pointer := pointer - objectMemory bytesPerWord)
		put: (objectMemory fetchPointer: ReceiverIndex ofObject: aContext).
	stackPtrIndex := self quickFetchInteger: StackPointerIndex ofObject: aContext.
	self assert: ReceiverIndex + stackPtrIndex < (objectMemory lengthOf: aContext).
	numArgs + 1 to: stackPtrIndex do:
		[:i|
		stackPages
			longAt: (pointer := pointer - objectMemory bytesPerWord)
			put: (objectMemory fetchPointer: ReceiverIndex + i ofObject: aContext)].
	"last thing on stack is the instruction pointer"
	(objectMemory isIntegerObject: (objectMemory fetchPointer: InstructionPointerIndex ofObject: aContext)) ifFalse:
		[self error: 'context is not resumable'].
	stackPages
		longAt: (pointer := pointer - objectMemory bytesPerWord)
		put: (self frameInstructionPointerForContext: aContext method: theMethod).
	self assert: (objectMemory fetchPointer: InstructionPointerIndex ofObject: aContext)
			= (self contextInstructionPointer: (stackPages longAt: pointer) frame: page baseFP).
	page setHeadSP: pointer.

	"Mark context as married by setting its sender to the frame pointer plus SmallInteger
	 tags and the InstructionPointer to the saved fp (which ensures correct alignment
	 w.r.t. the frame when we check for validity)"
	objectMemory storePointerUnchecked: SenderIndex
		ofObject: aContext
		withValue: (self withSmallIntegerTags: page baseFP).
	objectMemory storePointerUnchecked: InstructionPointerIndex
		ofObject: aContext
		withValue: (self withSmallIntegerTags: 0).
	self assert: (objectMemory isIntegerObject: (objectMemory fetchPointer: SenderIndex ofObject: aContext)).
	self assert: (self frameOfMarriedContext: aContext) = page baseFP.

	^page