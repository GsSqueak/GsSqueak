frame access
frameHasContext: theFP 
	"See encodeFrameFieldHasContext:numArgs:"
	^ (stackPages byteAt: theFP + FoxFrameFlags + 2)
		~= 0