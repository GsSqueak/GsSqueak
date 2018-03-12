*TopazGUI
upToLastLineMatching: regex

	| newStream buffer readData |
	buffer := buffer1 species new: 1000.
	newStream := WriteStream on: (buffer1 species new: 100).
	[self moveAvailableDataToBuffer.
	readData := self nextInto: buffer.
	readData isEmpty and: [regex match: (newStream contents lines atLast: 1)]] 
		whileFalse: [newStream nextPutAll: readData].
	^ newStream contents
