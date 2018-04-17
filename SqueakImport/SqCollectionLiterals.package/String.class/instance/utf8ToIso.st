internet
utf8ToIso
	"Only UTF-8 characters that maps to 8-bit ISO-8559-1 values are converted. Others raises an error"
	| s i c v c2 v2 |
	s := WriteStream on: (String new: self size).
	
	i := 1.
	[i <= self size] whileTrue: [
		c := self at: i. i:=i+1.
		v := c asciiValue.
		(v > 128)
			ifFalse: [ s nextPut: c ]
			ifTrue: [((v bitAnd: 252) = 192)
				ifFalse: [self error: 'illegal UTF-8 ISO character']
				ifTrue: [
					(i > self size) ifTrue: [ self error: 'illegal end-of-string, expected 2nd byte of UTF-8'].
					c2 := self at: i. i:=i+1.
					v2 := c2 asciiValue.
					((v2 bitAnd: 192) = 128) ifFalse: [self error: 'illegal 2nd UTF-8 char']. 
					s nextPut: ((v2 bitAnd: 63) bitOr: ((v << 6) bitAnd: 192)) asCharacter]]].
	^s contents. 
