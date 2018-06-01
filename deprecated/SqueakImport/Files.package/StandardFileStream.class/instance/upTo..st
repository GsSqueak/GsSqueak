read, write, position
upTo: delimiter

	| pos |
	collection ifNotNil: [
		(position < readLimit and: [
			(pos := collection indexOf: delimiter startingAt: position + 1) <= readLimit and: [
				pos > 0 ] ]) ifTrue: [
					^collection copyFrom: position + 1 to: (position := pos) - 1 ] ].
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
			((pos := buffer indexOf: delimiter startingAt: 1) = 0 or: [ pos > bytesRead ])
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
					false "Found the delimiter." ] ] whileTrue ]