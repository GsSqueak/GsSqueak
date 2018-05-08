testing
testTextAnchor
	| att strm |
	att := TextAnchor new anchoredMorph: RectangleMorph new initialize.
	strm := WriteStream on: ''.
	self assert: (att respondsTo: #writeScanOn:).
	att writeScanOn: strm. "FIXME - is TextAnchor used for anything?"
