parsing topaz output
convertToCategoryString: categoryDict

	^ String streamContents: [:stream |
		categoryDict keysDo: [:category |
			stream nextPut: $(.
			stream nextPutAll: category asString.
			(categoryDict at: category) do: [:selector |
				stream space.
				stream nextPutAll: selector asString].
			stream nextPut: $); cr]]