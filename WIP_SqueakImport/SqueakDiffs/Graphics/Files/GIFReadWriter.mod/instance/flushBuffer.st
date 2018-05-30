private-packing
flushBuffer
	bufStream isEmpty ifTrue: [^self].
	self nextPut: bufStream size.
	self nextPutAll: bufStream contents.
	bufStream := WriteStream on: (ByteArray new: 256)