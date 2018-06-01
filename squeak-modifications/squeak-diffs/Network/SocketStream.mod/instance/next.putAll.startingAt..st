stream out
next: n putAll: aCollection startingAt: startIndex
	"Put a String or a ByteArray onto the stream.
	Currently a large collection will allocate a large buffer.
	Warning: this does not work with WideString: they have to be converted first."

	n > 0 ifFalse: [ ^aCollection ].
	self adjustOutBuffer: n.
	outBuffer replaceFrom: outNextToWrite to: outNextToWrite + n - 1 with: aCollection startingAt: startIndex.
	outNextToWrite := outNextToWrite + n.
	self checkFlush.
	^aCollection