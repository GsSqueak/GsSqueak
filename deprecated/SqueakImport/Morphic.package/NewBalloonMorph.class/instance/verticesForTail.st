drawing
verticesForTail

	| offset factorX factorY tpos bpos |
	offset := 5 + (self wantsRoundedCorners
		ifTrue: [self cornerRadius]
		ifFalse: [0]).
	tpos := self tailPosition.
	factorX := tpos x < self center x ifTrue: [1] ifFalse: [-1].
	factorY := tpos y > self center y ifTrue: [1] ifFalse: [-1].
	bpos := self bubbleBounds perform: self orientation.
		
	^ {
		tpos.
		bpos + (((offset + self tailWidth) * factorX) @ (self borderStyle width negated * factorY)).
		bpos + ((offset * factorX) @ (self borderStyle width negated * factorY)).}