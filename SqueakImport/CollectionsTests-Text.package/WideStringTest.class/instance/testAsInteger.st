tests - converting
testAsInteger

	#(
		'' nil nil nil
		'1796exportFixes-tkMX' 1796 1796 1796
		'donald' nil nil nil
		'abc234def567' 234 234 234
		'-94' -94 -94 94
		'foo-bar-92' -92 -92 92
	) groupsDo: [ :inputString :asIntegerExpectedValue :asSignedIntegerExpectedValue :asUnsignedIntegerExpectedValue |
		| wideString |
		wideString := inputString asWideString.
		self
			assert: asIntegerExpectedValue equals: wideString asInteger;
			assert: asSignedIntegerExpectedValue equals: wideString asSignedInteger;
			assert: asUnsignedIntegerExpectedValue equals: wideString asUnsignedInteger ]