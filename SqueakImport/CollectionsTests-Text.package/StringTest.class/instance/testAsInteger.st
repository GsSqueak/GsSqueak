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
		self
			assert: asIntegerExpectedValue equals: inputString asInteger;
			assert: asSignedIntegerExpectedValue equals: inputString asSignedInteger;
			assert: asUnsignedIntegerExpectedValue equals: inputString asUnsignedInteger ]