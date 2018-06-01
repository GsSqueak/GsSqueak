access
flush
	dirty ifTrue:
		["Write buffer, compressed, to file, and also write the segment offset and eof"
		self writeSegment].