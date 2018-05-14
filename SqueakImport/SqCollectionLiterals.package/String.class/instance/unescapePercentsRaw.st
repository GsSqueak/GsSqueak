converting
unescapePercentsRaw
	"Decode myself if I'm percent-encoded, also replace + with space. Return self if the encoding is not valid."
	
	^String new: self size streamContents: [ :stream |
		| value1 value2 specialChars startIndex endIndex |
		specialChars := '+%' asCharacterSet.
		startIndex := 1.
		[ (endIndex := self indexOfAnyOf: specialChars startingAt: startIndex) > 0 ] whileTrue: [
			stream 	next: endIndex - startIndex putAll: self startingAt: startIndex.
			(self at: endIndex) == $%
				ifTrue: [
					endIndex + 2 <= self size ifFalse: [ ^self ].
					value1 := (self at: endIndex + 1) asUppercase digitValue.
					(value1 < 0 or: [ value1 > 15 ]) ifTrue: [ ^self ].
					value2 := (self at: endIndex + 2) asUppercase digitValue.
					(value2 < 0 or: [ value2 > 15 ]) ifTrue: [ ^self ].
					stream nextPut: (Character value: value1 * 16 + value2).
					startIndex := endIndex + 3 ]
				ifFalse: [ "$+"
					stream nextPut: Character space.
					startIndex := endIndex + 1 ] ].
		startIndex <= self size ifTrue: [
			stream next: self size + 1 - startIndex putAll: self startingAt: startIndex ] ]
