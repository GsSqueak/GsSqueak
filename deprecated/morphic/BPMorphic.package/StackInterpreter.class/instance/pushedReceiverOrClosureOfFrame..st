frame access
pushedReceiverOrClosureOfFrame: theFP 
	"The receiver of a message send or the closure of a block activation is
	always on the stack above any arguments and the frame itself. See
	the diagram in StackInterpreter class>>initializeFrameIndices."
	^ stackPages longAt: theFP
			+ (self frameStackedReceiverOffset: theFP)