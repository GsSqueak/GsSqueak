*SqNumbers-comparing
hash
	"Hash is reimplemented because = is implemented. Both words of the float are used. (The bitShift:'s ensure that the intermediate results do not become a large integer.) Care is taken to answer same hash as an equal Integer."

	(self isFinite and: [self fractionPart = 0.0]) ifTrue: [^self truncated hash].
	^ ((self basicAt: 1) bitShift: -4) +
	   ((self basicAt: 2) bitShift: -4)
