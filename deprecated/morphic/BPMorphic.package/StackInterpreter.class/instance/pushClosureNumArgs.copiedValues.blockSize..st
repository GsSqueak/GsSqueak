stack bytecodes
pushClosureNumArgs: numArgs copiedValues: numCopied blockSize: blockSize 
	"The compiler has pushed the values to be copied, if any.
	Create a Closure with space for the copiedValues and pop numCopied
	values off the stack into the closure.
	Set numArgs as specified, and set startpc to the pc following the
	block size and jump over that code."
	"No need to record the pushed copied values in the outerContext."
	| _gsSqueakTemp_newClosure _gsSqueakTemp_context |
	_gsSqueakTemp_context := self ensureFrameIsMarried: localFP SP: localSP + (numCopied * objectMemory bytesPerOop).
	_gsSqueakTemp_newClosure := self
				closureIn: _gsSqueakTemp_context
				numArgs: numArgs
				instructionPointer: (self oopForPointer: localIP)
						+ 2 - (method + objectMemory baseHeaderSize)
				numCopiedValues: numCopied.
	numCopied > 0
		ifTrue: [0
				to: numCopied - 1
				do: [:i | "Assume: have just allocated a new BlockClosure; it
					must be young.
					Thus, can use unchecked stores."
					objectMemory
						storePointerUnchecked: i + ClosureFirstCopiedValueIndex
						ofObject: _gsSqueakTemp_newClosure
						withValue: (self internalStackValue: numCopied - i - 1)].
			self internalPop: numCopied].
	localIP := localIP + blockSize.
	self fetchNextBytecode.
	self internalPush: _gsSqueakTemp_newClosure