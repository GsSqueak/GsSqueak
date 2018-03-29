internal interpreter access
nativeStackPointerIn: theFP put: valueOopPointer 
	"See StackInterpreter class>>initializeFrameIndices"
	^ stackPages pointerAtPointer: theFP + FoxReceiver - (BytesPerWord * 4) put: valueOopPointer