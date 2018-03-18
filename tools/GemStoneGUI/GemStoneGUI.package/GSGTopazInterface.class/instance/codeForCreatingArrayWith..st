helpers
codeForCreatingArrayWith: elements

	^ String streamContents: [:stream |
		stream nextPut: ${.
		elements
			do: [:element |
				stream space.
				element storeOn: stream.
				stream space]
			separatedBy: [stream nextPut: $.].
		stream nextPut: $}]