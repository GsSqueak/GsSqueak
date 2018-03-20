parsing topaz output
convertToCategoryString: categoryDict

	^ String streamContents: [:stream |
		categoryDict keysAndValuesDo: [:category :selectors |
			stream nextPut: $(.
			stream nextPutAll: category asString printString.
			selectors do: [:selector |
				stream space.
				stream nextPutAll: selector asString].
			stream nextPut: $); cr]]