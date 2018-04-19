*SqCollectionLiterals-*SqCollectionLiterals-internet
isoToUtf8
	"Convert ISO 8559-1 to UTF-8"
	| s |
	s := WriteStream on: (String new: self size).
	self do: [:c |
		| v |
		v := c asciiValue.
		(v > 128)
			ifFalse: [s nextPut: c]
			ifTrue: [
				s nextPut: (192+(v >> 6)) asCharacter.
				s nextPut: (128+(v bitAnd: 63)) asCharacter]].
	^s contents. 
