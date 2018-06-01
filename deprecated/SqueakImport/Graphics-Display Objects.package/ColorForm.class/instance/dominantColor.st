analyzing
dominantColor
	"Overridden to consider color table"
	
	| tally max maxi |
	tally := self tallyPixelValues.
	max := maxi := 0.
	tally withIndexDo: [:n :i | n > max ifTrue: [max := n. maxi := i]].
	^ self colors at: maxi