primitives-cursor
primCursorLocPut: aPoint 
	"If the primitive fails, try again with a rounded point."
	self halt.
	^ self primCursorLocPutAgain: aPoint rounded