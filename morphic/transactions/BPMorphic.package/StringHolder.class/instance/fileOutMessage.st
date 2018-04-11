-Tools
fileOutMessage
	"Put a description of the selected message on a file.
	If no message is selected, put a description of ALL the message list."
	self selectedMessageName
		ifNil: [self fileOutAllMessages]
		ifNotNil: [Cursor write
				showWhile: [self selectedClassOrMetaClass fileOutMethod: self selectedMessageName]]