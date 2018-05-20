query construction
transformationSource

	| isFirst |
	^ String streamContents: [:stream |
		isFirst := true.
		stream nextPutAll: 'Dictionary new addAll: {'.
		self transformations associationsDo: [:assoc |
			isFirst
				ifTrue: [isFirst := false]
				ifFalse: [stream nextPut: $.; nextPut: Character cr].
			assoc key storeOn: stream.
			stream nextPutAll: ' -> '.
			stream nextPutAll: assoc value sourceString].
		stream nextPutAll: '}; yourself']