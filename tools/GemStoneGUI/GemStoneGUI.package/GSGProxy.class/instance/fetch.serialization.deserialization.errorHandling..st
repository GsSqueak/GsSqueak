queries
fetch: queryCode serialization: serializationBlock deserialization: deserializationBlock errorHandling: errorHandlingBlock

	| query output errorOutput result |
	query := serializationBlock
				ifNil: [queryCode]
				ifNotNil: [:block | block value: '(' , queryCode , ')'].
	output := self run: query.
	result := output first.
	errorOutput := output second.
	(errorOutput notEmpty and: [errorHandlingBlock notNil]) ifTrue: [
		^ errorHandlingBlock value: errorOutput].
	^ deserializationBlock
		ifNil: [result]
		ifNotNil: [:block | block value: result]