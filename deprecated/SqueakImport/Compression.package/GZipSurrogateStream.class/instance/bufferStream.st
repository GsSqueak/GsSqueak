private
bufferStream

	^bufferStream ifNil: [bufferStream := RWBinaryOrTextStream on: (ByteArray new: 5000)].
