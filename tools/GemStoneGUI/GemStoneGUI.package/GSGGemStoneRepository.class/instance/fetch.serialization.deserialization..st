querying
fetch: queryCode serialization: serializationBlock deserialization: deserializationBlock

	| query result |
	query := serializationBlock
				ifNil: [queryCode]
				ifNotNil: [:block | block value: '(' , queryCode , ')'].
	result := self executeString: query.
	^ deserializationBlock
		ifNil: [result]
		ifNotNil: [:block | block value: result]