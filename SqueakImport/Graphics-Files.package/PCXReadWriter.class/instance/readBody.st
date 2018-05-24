private-decoding
readBody

	| array scanLine rowBytes position byte count pad |
	pad := #(0 3 2 1) at: (width \\ 4 + 1).
	array := ByteArray new: ((width + pad) * height * bitsPerPixel) // 8.
	scanLine := ByteArray new: rowByteSize.
	position := 1.
	1 to: height do:
		[:line |
		rowBytes := 0.
		[rowBytes < rowByteSize] whileTrue:
			[byte := self next.
			byte < 16rC0
				ifTrue:
					[rowBytes := rowBytes + 1.
					scanLine at: rowBytes put: byte]
				ifFalse:
					[count := byte - 16rC0.
					byte := self next.
					1 to: count do: [:i | scanLine at: rowBytes + i put: byte].
					rowBytes := rowBytes + count]].
		array
			replaceFrom: position
			to: position + width - 1
			with: scanLine
			startingAt: 1.
		position := position + width + pad].
	^ array
