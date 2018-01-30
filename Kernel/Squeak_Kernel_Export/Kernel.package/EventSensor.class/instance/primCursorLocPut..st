primitives-cursor
primCursorLocPut: aPoint
	"If the primitive fails, try again with a rounded point."

	<primitive: 91>
	^ self primCursorLocPutAgain: aPoint rounded