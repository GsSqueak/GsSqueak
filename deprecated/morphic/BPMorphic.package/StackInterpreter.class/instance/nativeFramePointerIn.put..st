internal interpreter access
nativeFramePointerIn: theFP put: valueOopPointer 
	"See StackInterpreter class>>initializeFrameIndices"
	^ stackPages pointerAtPointer: theFP + FoxReceiver - (BytesPerWord * 3) put: valueOopPointer