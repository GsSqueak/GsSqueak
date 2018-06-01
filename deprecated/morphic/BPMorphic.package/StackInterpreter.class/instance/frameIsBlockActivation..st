frame access
frameIsBlockActivation: theFP 
	"<Integer>"
	^ (stackPages byteAt: theFP + FoxFrameFlags + 3)
		~= 0