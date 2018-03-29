internal interpreter access
shadowCallStackPointerIn: theFP put: valueOopPointer 
	"See StackInterpreter class>>initializeFrameIndices"
	^ stackPages pointerAtPointer: theFP + FoxReceiver - (BytesPerWord * 5) put: valueOopPointer