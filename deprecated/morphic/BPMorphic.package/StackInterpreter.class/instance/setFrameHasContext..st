frame access
setFrameHasContext: theFP 
	"See encodeFrameFieldHasContext:numArgs:"
	stackPages byteAt: theFP + FoxFrameFlags + 2 put: 1