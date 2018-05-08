testing
testTextAlignment
	#(leftFlush rightFlush centered justified) do: [:alignment |
		| att |
		att := TextAlignment perform: alignment.
		self testScanAttribute: att encodedWithCharacter: $a decodedWithBlock: [:strm |
			TextAlignment new alignment: (Integer readFrom: strm ifFail: [-1])].
		self testScanAttribute: att encodedWithCharacter: $a decodedWithBlock: [:strm |
			TextAlignment scanFrom: strm]].