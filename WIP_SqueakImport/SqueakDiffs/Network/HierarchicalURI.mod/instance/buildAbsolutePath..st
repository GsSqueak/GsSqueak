private
buildAbsolutePath: pathComponents
	^String streamContents: [:stream |
		stream nextPut: $/.
		pathComponents
			do: [:pathPart | stream nextPutAll: pathPart]
			separatedBy: [stream nextPut: $/]]