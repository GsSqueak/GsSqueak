testing
testTextMessageLink
	| att strm |
	att := TextMessageLink message: Message someInstance.
	strm := WriteStream on: ''.
	self assert: (att respondsTo: #writeScanOn:).
	att writeScanOn: strm. "FIXME - is TextMessageLink used for anything?"
