internal interpreter access
nativeFrameSignalObjectIn: theFP put: oop 
	"See StackInterpreter class>>initializeFrameIndices"
	^ stackPages longAt: theFP + FoxReceiver - BytesPerWord put: oop