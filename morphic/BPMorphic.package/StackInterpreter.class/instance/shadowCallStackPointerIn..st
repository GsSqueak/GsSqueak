internal interpreter access
shadowCallStackPointerIn: theFP 
	"See StackInterpreter class>>initializeFrameIndices"
	^ stackPages pointerAtPointer: theFP + FoxReceiver - (BytesPerWord * 5)