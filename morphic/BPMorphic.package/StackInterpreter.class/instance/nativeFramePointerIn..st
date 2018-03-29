internal interpreter access
nativeFramePointerIn: theFP 
	"See StackInterpreter class>>initializeFrameIndices"
	^ stackPages pointerAtPointer: theFP + FoxReceiver - (BytesPerWord * 3)