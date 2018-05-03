file primitives
sqFile: file Write: count From: byteArrayIndex At: startIndex

	startIndex to: (startIndex + count - 1) do: [ :i |
		file nextPut: (objectMemory byteAt: byteArrayIndex + i).
	].
	^ count