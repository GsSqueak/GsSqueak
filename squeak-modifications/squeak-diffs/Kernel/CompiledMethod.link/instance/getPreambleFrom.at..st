source code management
getPreambleFrom: aFileStream at: endPosition
	"This method is an ugly hack. This method assumes that source files have ASCII-compatible encoding and that preambles contain no non-ASCII characters."

	| chunkSize chunk |
	chunkSize := 160 min: endPosition.
	[
		| index |
		chunk := aFileStream
			position: (endPosition - chunkSize + 1 max: 0);
			basicNext: chunkSize.
		(index := chunk lastIndexOf: $! startingAt: chunk size ifAbsent: 0) ~= 0 ifTrue: [
			^chunk copyFrom: index + 1 to: chunk size ].
		chunkSize := chunkSize * 2.
		chunkSize <= endPosition ] whileTrue.
	^chunk