debug support
charsOfLong: long
	^ (1 to: bytesPerWord) collect:
		[:i | ((long digitAt: i) between: 14 and: 126)
					ifTrue: [(long digitAt: i) asCharacter]
					ifFalse: [$?]]