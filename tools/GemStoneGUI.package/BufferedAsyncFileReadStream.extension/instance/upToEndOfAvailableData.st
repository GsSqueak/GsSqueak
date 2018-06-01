*GemStoneGUI
upToEndOfAvailableData

	| newStream buffer readData |
	buffer := buffer1 species new: 1000.
	newStream := WriteStream on: (buffer1 species new: 100).
	[self moveAvailableDataToBuffer.
	readData := self nextInto: buffer.
	readData isEmpty] 
		whileFalse: [newStream nextPutAll: readData].
	^ newStream contents
