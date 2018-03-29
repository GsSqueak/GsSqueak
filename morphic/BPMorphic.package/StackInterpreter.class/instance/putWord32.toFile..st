image save/restore
putWord32: aWord32 toFile: aFile 
	"Append aWord32 to aFile in this platform's 'natural' byte order.
	aWord32 is 32 bits,
	depending on ObjectMemory. (Bytes will be swapped, if necessary,
	when the image is read
	on a different platform.) Set successFlag to false if the write fails."
	| _gsSqueakTemp_objectsWritten |
	_gsSqueakTemp_objectsWritten := self
				cCode: [self
						sq: (self addressOf: aWord32)
						Image: 4
						File: 1
						Write: aFile]
				inSmalltalk: [| value |
					value := aWord32.
					4
						timesRepeat: [aFile
								nextPut: (value bitAnd: 255).
							value := value >> 8].
					1].
	self success: _gsSqueakTemp_objectsWritten = 1