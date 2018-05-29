private
fill: fillColor
	fillColor isSolidFill
		ifTrue: [self paint: fillColor asColor operation: #eofill]
		ifFalse: [self preserveStateDuring: [:inner | inner clip; drawGradient: fillColor]]