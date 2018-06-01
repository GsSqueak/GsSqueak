utility
encodeString: aString 
	| str dec out |
	str := String new: (aString size * 4 / 3 + 3) ceiling.
	dec := Base64MimeConverter new.
	dec
		mimeStream: (out := WriteStream on: str);
		dataStream: (ReadStream on: aString);
		multiLine: false;
		mimeEncode.
	^out contents