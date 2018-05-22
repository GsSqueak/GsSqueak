read, write, position
upToAnyOf: delimiters do: aBlock

	| pos |
	collection ifNotNil: [
		(position < readLimit and: [
			(pos := collection indexOfAnyOf: delimiters startingAt: position + 1) <= readLimit and: [
				pos > 0 ] ]) ifTrue: [
					| result |
					result := collection copyFrom: position + 1 to: (position := pos) - 1 .
					aBlock value: (collection at: position).
					^result ] ].
	^self collectionSpecies streamContents: [ :stream |
		| buffer bytesRead |
		buffer := collection 
			ifNil: [ self collectionSpecies new: 2000 ]
			ifNotNil: [
				position < readLimit ifTrue: [
					stream next: readLimit - position putAll: collection startingAt: position + 1.
					position := readLimit ].
				collection ].
		[
			bytesRead := self readInto: buffer startingAt: 1 count: buffer size.
			((pos := buffer indexOfAnyOf: delimiters startingAt: 1) = 0 or: [ pos > bytesRead ])
				ifTrue: [ 
					stream next: bytesRead putAll: buffer startingAt: 1.
					bytesRead > 0 "Try again if we could read something last time." ]
				ifFalse: [
					stream next: pos - 1 putAll: buffer startingAt: 1.
					collection 
						ifNil: [ self skip: pos - bytesRead ]
						ifNotNil: [
							position := pos.
							readLimit := bytesRead ].
					false "Found the delimiter." ] ] whileTrue.
		bytesRead = 0 ifFalse: [
			aBlock value: (buffer at: pos) ] ]