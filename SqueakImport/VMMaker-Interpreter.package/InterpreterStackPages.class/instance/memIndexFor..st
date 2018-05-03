page access
memIndexFor: byteAddress
	^(self oopForPointer: byteAddress) // self bytesPerWord + indexOffset