testing
testTextPlusJumpEnd
	| att strm |
	att := TextPlusJumpEnd new jumpLabel: 'this is a jump label'.
	strm := WriteStream on: ''.
	self assert: (att respondsTo: #writeScanOn:).
	att writeScanOn: strm. "FIXME - is TextPlusJumpEnd used for anything?"
