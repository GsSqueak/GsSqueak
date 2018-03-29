internal interpreter access
nativeFrameSignalObjectIn: theFP 
	"See StackInterpreter class>>initializeFrameIndices"
	^ stackPages longAt: theFP + FoxReceiver - (BytesPerWord * 3)