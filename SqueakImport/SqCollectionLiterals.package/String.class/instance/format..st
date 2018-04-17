formatting
format: aCollection 
	"format the receiver with aCollection  
	 
	simplest example:  
	'foo {1} bar' format: {Date today}.
	 
	complete example:  
	'\{ \} \\ foo {1} bar {2}' format: {12. 'string'}. 
	"
	^self class new: self size * 11 // 10 "+10%" streamContents: [ :output |
		| lastIndex nextIndex |
		lastIndex := 1.
		[ (nextIndex := self indexOfAnyOf: FormatCharacterSet startingAt: lastIndex) = 0 ] whileFalse: [
			nextIndex = lastIndex ifFalse: [
				output next: nextIndex - lastIndex putAll: self startingAt: lastIndex ].
			(self at: nextIndex) == $\
				ifTrue: [ output nextPut: (self at: (nextIndex := nextIndex + 1)) ]
				ifFalse: [ "${"
					"Parse the index - a positive integer in base 10."
					| digitValue collectionIndex |
					collectionIndex := 0.
					[ (digitValue := self basicAt: (nextIndex := nextIndex + 1)) between: 48 "$0 asciiValue" and: 57 "$9 asciiValue" ] whileTrue: [
						collectionIndex := collectionIndex * 10 + digitValue - 48. "$0 asciiValue" ].
					digitValue =  125 "$} asciiValue" ifFalse: [ self error: '$} expected' ].
					output nextPutAll: (aCollection at: collectionIndex) asString ].
			lastIndex := nextIndex + 1 ].
		lastIndex <= self size ifTrue: [
			output next: self size - lastIndex + 1 putAll: self startingAt: lastIndex ] ]