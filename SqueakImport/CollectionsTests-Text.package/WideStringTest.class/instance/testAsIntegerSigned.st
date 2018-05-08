tests - converting
testAsIntegerSigned

	#(
		'' nil nil
		'1796exportFixes-tkMX' 1796 1796
		'donald' nil nil
		'abc234def567' 234 234
		'-94' -94 94
		'foo-bar-92' -92 92
		'1234567890' 1234567890 1234567890
		'--1234567890--' -1234567890 1234567890
		'--1234567890123456789012345678901234567890--' -1234567890123456789012345678901234567890 1234567890123456789012345678901234567890
	) groupsDo: [ :inputString :expectedSignedValue :expectedUnsignedValue |
		self
			assert: expectedSignedValue equals: (inputString asIntegerSigned: true);
			assert: expectedUnsignedValue equals: (inputString asIntegerSigned: false) ]