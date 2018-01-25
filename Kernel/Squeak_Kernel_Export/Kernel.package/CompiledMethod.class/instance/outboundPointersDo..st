tracing
outboundPointersDo: aBlock

	| numLiterals |
	aBlock value: self class.
	numLiterals := self numLiterals.
	1 to: numLiterals do: [:i | aBlock value: (self literalAt: i)]