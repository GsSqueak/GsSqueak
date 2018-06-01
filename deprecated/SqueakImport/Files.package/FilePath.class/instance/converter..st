conversion
converter: aTextConverter

	converter class ~= aTextConverter class ifTrue: [
		converter := aTextConverter.
		vmPathName := squeakPathName convertToWithConverter: converter
	].
