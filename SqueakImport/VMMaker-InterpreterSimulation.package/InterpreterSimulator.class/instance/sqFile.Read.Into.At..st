file primitives
sqFile: file Read: count Into: byteArrayIndex At: startIndex

	startIndex to: (startIndex + count - 1) do: [ :i |
		file atEnd ifTrue: [ ^ i - startIndex ].
		objectMemory byteAt: byteArrayIndex + i put: file next.
	].
	^ count