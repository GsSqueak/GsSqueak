frame access
frameNumArgs: theFP 
	"See encodeFrameFieldHasContext:numArgs:"
	^ stackPages byteAt: theFP + FoxFrameFlags + 1