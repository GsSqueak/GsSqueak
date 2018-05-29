private-initialization
referenceVertexAt: index
	"Only used while reading before constructing contours"
	| count |
	count := 0.
	contours do: [:construction | | vertices |
		vertices := construction points.
		index - count > vertices size
			ifTrue: [count := count + vertices size]
			ifFalse: [^(vertices at: index - count) asPoint]].
	^count