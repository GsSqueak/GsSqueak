internal interpreter access
framePointerOfNativeLocal: offset in: theFP 
	^ (self nativeFramePointerIn: theFP)
		+ offset - 1