comparing
inRangeOf: first and: second 
	"Answer whether the receiver is in the range between first and second, even if first is > second."
	^ first < second
		ifTrue:
			[ self
				between: first
				and: second ]
		ifFalse:
			[ self
				between: second
				and: first ]