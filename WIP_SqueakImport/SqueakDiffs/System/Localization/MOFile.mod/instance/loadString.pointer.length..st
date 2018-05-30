private
loadString: strm pointer: top  length: len
	| str |
	str := ByteString new: len.
	strm position:  top.
	strm nextInto: str.
	^str replaceAll: Lf with: Cr.
