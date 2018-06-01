initialize-release
installLineEndConvention: lineEndStringOrNil

	latin1Map := self class latin1Map.
	latin1Encodings := self class latin1Encodings.
	lineEndStringOrNil ifNotNil:
		[latin1Encodings := latin1Encodings copy.
		latin1Encodings at: Character cr asciiValue + 1 put: lineEndStringOrNil.
		latin1Map := latin1Map copy.
		latin1Map at: Character cr asciiValue + 1 put: 1]