internal interpreter access
nativePreviousStackPointerIn: theFP put: valueOopPointer 
	"See StackInterpreter class>>initializeFrameIndices"
	^ stackPages pointerAtPointer: theFP + FoxReceiver - (BytesPerWord * 2) put: valueOopPointer