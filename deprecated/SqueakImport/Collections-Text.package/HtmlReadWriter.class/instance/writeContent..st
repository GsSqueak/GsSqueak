writing
writeContent: aString

	aString do: [:char |
		(#(10 13) includes: char asciiValue)
			ifTrue: [self cr]
			ifFalse: [char = Character tab
				ifTrue: [self nextPutAll: '&nbsp;&nbsp;&nbsp;&nbsp;']
				ifFalse: [(String htmlEntities keyAtValue: char ifAbsent: [])
					ifNil: [self nextPut: char]
					ifNotNil: [:escapeSequence |
						self
							nextPut: $&;
							nextPutAll: escapeSequence;
							nextPut: $;]]]].