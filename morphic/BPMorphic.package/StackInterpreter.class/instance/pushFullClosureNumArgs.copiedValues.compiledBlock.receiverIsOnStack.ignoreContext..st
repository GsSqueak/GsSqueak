stack bytecodes
pushFullClosureNumArgs: numArgs copiedValues: numCopiedArg compiledBlock: compiledBlock receiverIsOnStack: receiverIsOnStack ignoreContext: ignoreContext 
	"The compiler has pushed the values to be copied, if any. The receiver
	has been pushed on stack before if specified. 
	Create a Closure with space for the copiedValues and pop numCopied
	values off the stack into the closure.
	Sets outerContext, compiledBlock, numArgs and receiver as
	specified.. "
	"No need to record the pushed copied values in the outerContext."
	| _gsSqueakTemp_numCopied _gsSqueakTemp_newClosure _gsSqueakTemp_context _gsSqueakTemp_startIndex |
	_gsSqueakTemp_context := ignoreContext
				ifTrue: [objectMemory nilObject]
				ifFalse: [self ensureFrameIsMarried: localFP SP: localSP + (numCopiedArg * objectMemory bytesPerOop)].
	_gsSqueakTemp_newClosure := self
				fullClosureIn: _gsSqueakTemp_context
				numArgs: numArgs
				numCopiedValues: numCopiedArg
				compiledBlock: compiledBlock.
	receiverIsOnStack
		ifTrue: [_gsSqueakTemp_startIndex := FullClosureReceiverIndex.
			_gsSqueakTemp_numCopied := numCopiedArg + 1]
		ifFalse: [_gsSqueakTemp_startIndex := FullClosureFirstCopiedValueIndex.
			objectMemory
				storePointerUnchecked: FullClosureReceiverIndex
				ofObject: _gsSqueakTemp_newClosure
				withValue: self receiver.
			_gsSqueakTemp_numCopied := numCopiedArg].
	_gsSqueakTemp_numCopied > 0
		ifTrue: [0
				to: _gsSqueakTemp_numCopied - 1
				do: [:i | "Assume: have just allocated a new BlockClosure; it
					must be young.
					Thus, can use unchecked stores."
					objectMemory
						storePointerUnchecked: i + _gsSqueakTemp_startIndex
						ofObject: _gsSqueakTemp_newClosure
						withValue: (self internalStackValue: _gsSqueakTemp_numCopied - i - 1)].
			self internalPop: _gsSqueakTemp_numCopied].
	self fetchNextBytecode.
	self internalPush: _gsSqueakTemp_newClosure