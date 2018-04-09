*SqCollectionLiterals-converting
asPrecomposedUnicode
	"Convert the receiver into a precomposed Unicode representation.
	Optimized for the common case that no composition needs to take place."
	| lastIndex nextIndex composed out |
	lastIndex := 1.
	nextIndex := 0.
	[(nextIndex := nextIndex+1) < self size] whileTrue:[
		composed := Unicode compose: (self at: nextIndex) with: (self at: nextIndex+1).
		composed ifNotNil:[
			lastIndex = 1 ifTrue:[out := WriteStream on: (String new: self size)].
			out nextPutAll: (self copyFrom: lastIndex to: nextIndex-1).
			out nextPut: composed.
			nextIndex := nextIndex+1.
			lastIndex := nextIndex+1.
		].
	].
	^out ifNil:[self] ifNotNil:[
		out nextPutAll: (self copyFrom: lastIndex to: self size).
		out contents]
