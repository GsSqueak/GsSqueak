*VMMaker-Translation to C
replaceLastOccurrence: oldSubstring with: newSubstring 
	"Answer a copy with the last occurrence of oldSubstring replaced by newSubstring."

	" 'int i' replaceLastOccurrence: 'i' with: 'i2' "
	" 'void *v' replaceLastOccurrence: 'v' with: 'v2' "
	" 'int intxintxintx' replaceLastOccurrence: 'i' with: 'I2' "
	" 'int intxintxintx' replaceLastOccurrence: 'FOO' with: 'BAR' "
	" 'int intxintxintx' replaceLastOccurrence: '' with: 'BAZ' "

	^ self class streamContents: [:ws | | pos rs | 
			rs := ReadStream on: self.
			pos := self findLastOccurrenceOfString: oldSubstring startingAt: 1.
			pos > 0 ifTrue: [ws nextPutAll: (rs next: pos - 1); nextPutAll: newSubstring.
						rs next: oldSubstring size].
			ws nextPutAll: rs upToEnd]