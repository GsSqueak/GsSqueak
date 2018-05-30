private
flushBuffer

	| data |
	bufferStream ifNil: [^self].
	data := bufferStream contents asByteArray.
	gZipStream nextPutAll: data.
	positionThusFar := positionThusFar + data size.
	bufferStream := nil.
