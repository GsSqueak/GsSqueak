pen
getPenColor
	penColor
		ifNil: [penColor := self defaultPenColor].
	^ penColor