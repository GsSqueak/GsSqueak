geometry
charactersOccluded
	"Let the receiver suggest to its neighboring vertical Splitter(s) that they try to optimize their position such that none of the receivers visible lines need to wrap."
	| numberOfPhysicalLines lastPhysicalLine logicalLines physicalLines |
	numberOfPhysicalLines := 0.
	lastPhysicalLine := (physicalLines := textMorph paragraph lines)
		detect:
			[ : each | numberOfPhysicalLines := numberOfPhysicalLines + 1.
			each bottom > self height ]
		ifNone: [ physicalLines last ].
	logicalLines := (self text
		copyFrom: 1
		to: lastPhysicalLine last) lineCount.
	^ numberOfPhysicalLines - logicalLines