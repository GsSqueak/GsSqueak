image save/restore
putShort: aShort toFile: aFile 
	"Append the 16-bit aShort to aFile in this platform's 'natural' byte
	order. (Bytes will be swapped, if necessary, when the image is read on
	a different platform.) Set successFlag to false if the write fails."
	| _gsSqueakTemp_objectsWritten |
	_gsSqueakTemp_objectsWritten := self
				cCode: [self
						sq: (self addressOf: aShort)
						Image: (self sizeof: #short)
						File: 1
						Write: aFile]
				inSmalltalk: [aFile
						nextPut: (aShort bitAnd: 255);
						
						nextPut: (aShort >> 8 bitAnd: 255).
					1].
	self success: _gsSqueakTemp_objectsWritten = 1