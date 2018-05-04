frame access
frameStackedReceiverOffset: theFP
	"Answer the offset in bytes from the a frame pointer to its stacked receiver.
	 The receiver of a message send or the closure of a block activation is
	 always on the stack above any arguments and the frame itself.  See the
	 diagram in StackInterpreter class>>initializeFrameIndices."
	<inline: true>
	<var: #theFP type: #'char *'>
	^FoxCallerSavedIP + objectMemory bytesPerWord + ((self frameNumArgs: theFP) << self shiftForWord)