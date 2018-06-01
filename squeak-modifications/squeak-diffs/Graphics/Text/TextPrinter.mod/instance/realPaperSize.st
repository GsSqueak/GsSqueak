private
realPaperSize
	^self landscape
		ifTrue:[self paperSize y @ self paperSize x]
		ifFalse:[self paperSize]