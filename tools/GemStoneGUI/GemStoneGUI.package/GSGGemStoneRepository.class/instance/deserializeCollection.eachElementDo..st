deserialization
deserializeCollection: aString eachElementDo: elementBlock

	^ aString lines collect: [:line |
		| element |
		element := line withBlanksTrimmed.
		elementBlock value: element]