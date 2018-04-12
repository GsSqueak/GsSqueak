pen
getPenSize
	penSize
		ifNil: [penSize := self defaultPenSize].
	^ penSize