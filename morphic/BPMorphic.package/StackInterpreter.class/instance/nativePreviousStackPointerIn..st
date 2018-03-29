internal interpreter access
nativePreviousStackPointerIn: theFP 
	"See StackInterpreter class>>initializeFrameIndices"
	^ stackPages pointerAtPointer: theFP + FoxReceiver - (BytesPerWord * 2)