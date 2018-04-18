adding
, otherCollection
	"Override to answer an Interval if otherCollection is an adjacent and congruent interval."
	^(otherCollection isInterval
	  and: [otherCollection increment = step
	  and: [otherCollection first = (self last + step)]])
		ifTrue: [self class from: start to: otherCollection last by: step]
		ifFalse: [super, otherCollection]