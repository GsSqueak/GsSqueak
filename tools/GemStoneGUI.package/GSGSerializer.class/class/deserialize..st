public
deserialize: aStreamOrString

	| nextChar stream |
	stream := aStreamOrString readStream.
	nextChar := stream peek.
	nextChar = $# ifTrue: [^ self deserializeSymbol: stream].
	nextChar = $' ifTrue: [^ self deserializeString: stream].
	nextChar = $[ ifTrue: [^ self deserializeComposite: stream].
	nextChar isDigit ifTrue: [^ self deserializeNumber: stream].
	^ self deserializeSpecialObject: stream