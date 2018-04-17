converting
asDecomposedUnicode
	"Convert the receiver into a decomposed Unicode representation.
	Optimized for the common case that no decomposition needs to take place."
	| lastIndex nextIndex out decomposed |
	lastIndex := 1.
	nextIndex := 0.
	[(nextIndex := nextIndex+1) <= self size] whileTrue:[
		decomposed := Unicode decompose: (self at: nextIndex).
		decomposed ifNotNil:[
			lastIndex = 1 ifTrue:[out := WriteStream on: (String new: self size)].
			out nextPutAll: (self copyFrom: lastIndex to: nextIndex-1).
			out nextPutAll: decomposed.
			lastIndex := nextIndex+1.
		].
	].
	^out ifNil:[self] ifNotNil:[
		out nextPutAll: (self copyFrom: lastIndex to: self size).
		out contents]