testing
testPluggableTextAttribute
	| att strm |
	att := PluggableTextAttribute evalBlock: [ #foo ].
	strm := WriteStream on: ''.
	self assert: (att respondsTo: #writeScanOn:).
	self
		should: [att writeScanOn: strm]
		raise: Error
		description: 'PluggableTextAttribute are not intended to be serialized'.
