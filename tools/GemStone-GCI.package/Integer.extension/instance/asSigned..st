*GemStone-GCI
asSigned: bitCount

	| bits |.
	bitCount < 2 ifTrue: [self error: 'Cannot represent two''s complement with less than 2 bits'].
	bits := self bitAnd: (1 << bitCount) - 1.
	^ (self bitAnd: 1 << (bitCount - 1)) = 0
		ifTrue: [bits]
		ifFalse: [bits - (1 << bitCount)]