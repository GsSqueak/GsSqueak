formatting
expandMacrosWithArguments: anArray 
	
	^self class new: self size streamContents: [ :output |
		| lastIndex nextIndex |
		lastIndex := 1.
		[ (nextIndex := self indexOfAnyOf: CSMacroCharacters startingAt: lastIndex) = 0 ] whileFalse: [
			nextIndex = lastIndex ifFalse: [
				output next: nextIndex - lastIndex putAll: self startingAt: lastIndex ].
			(self at: nextIndex) == $% 
				ifTrue: [ output nextPut: (self at: (nextIndex := nextIndex + 1)) ]
				ifFalse: [ 
					| nextCharacter argumentIndex |
					nextCharacter := (self at: (nextIndex := nextIndex + 1)) asUppercase.
					nextCharacter == $N ifTrue: [ output cr ].
					nextCharacter == $T ifTrue: [ output tab ].
					(nextCharacter between: $0 and: $9) ifTrue: [
						argumentIndex := nextCharacter digitValue.
						[ (nextIndex := nextIndex + 1) <= self size and: [
							(nextCharacter := self at: nextIndex) between: $0 and: $9 ] ] whileTrue: [
								argumentIndex := argumentIndex * 10 + nextCharacter digitValue ].
						nextCharacter := nextCharacter asUppercase ].
					nextCharacter == $P ifTrue: [ output print: (anArray at: argumentIndex) ].
					nextCharacter == $S ifTrue: [ output nextPutAll: (anArray at: argumentIndex) ].
					nextCharacter == $? ifTrue: [ 
						| trueEnd falseEnd |
						trueEnd := self indexOf: $: startingAt: nextIndex + 1.
						falseEnd := self indexOf: $> startingAt: trueEnd + 1.
						(anArray at: argumentIndex)
							ifTrue: [ output next: trueEnd - nextIndex - 1 putAll: self startingAt: nextIndex + 1 ]
							ifFalse: [ output next: falseEnd - trueEnd - 1 putAll: self startingAt: trueEnd + 1 ].
						nextIndex := falseEnd - 1 ].
					(self at: (nextIndex := nextIndex + 1)) == $> ifFalse: [
						self error: '> expected' ] ].
			lastIndex := nextIndex + 1 ].
		lastIndex <= self size ifTrue: [
			output next: self size - lastIndex + 1 putAll: self startingAt: lastIndex ] ]
