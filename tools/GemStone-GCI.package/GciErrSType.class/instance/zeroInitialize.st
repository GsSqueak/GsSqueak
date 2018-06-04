initialization
zeroInitialize

	1 to: self class byteSize do: [:index |
		handle unsignedByteAt: index put: 0]