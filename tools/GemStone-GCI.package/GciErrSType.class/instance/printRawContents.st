printing
printRawContents

	^ String streamContents: [:stream |
		1 to: self class byteSize do: [:index |
			stream nextPut: (handle unsignedCharAt: index)]]