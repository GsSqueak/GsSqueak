testing
testTextPlusJumpStart
	| att strm |
	att := TextPlusJumpStart new jumpLabel: 'this is a jump label'.
	strm := WriteStream on: ''.
	self assert: (att respondsTo: #writeScanOn:).
	att writeScanOn: strm. "FIXME - is TextPlusJumpStart used for anything?"
