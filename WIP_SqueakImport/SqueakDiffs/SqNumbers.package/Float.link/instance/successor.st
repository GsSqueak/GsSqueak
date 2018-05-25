*SqNumbers-truncation and round off
successor
	| ulp |
	self isFinite ifFalse: [
		(self isNaN or: [self positive]) ifTrue: [^self].
		^Float fmax negated].
	ulp := self ulp.
	^self + (0.5 * ulp) = self
		ifTrue: [self * -1.0 - ulp * -1.0 "This trick is for obtaining a negativeZero"]
		ifFalse: [self + (0.5 * ulp)]
