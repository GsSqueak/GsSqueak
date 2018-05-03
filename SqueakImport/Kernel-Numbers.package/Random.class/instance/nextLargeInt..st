accessing
nextLargeInt: anInteger
	"Answer a random integer value from the interval [1, anInteger]. This method works for arbitrarily large integers."

	| byteCount bigRandom result firstDigit |
	byteCount := anInteger digitLength + 4. "Extend the space with at least 32 bits for a fairer distribution."
	bigRandom := LargePositiveInteger new: byteCount.
	self nextBytes: byteCount into: bigRandom startingAt: 1.
	bigRandom := bigRandom normalize. "Make sure that there are no leading zero bytes."
	result := anInteger * bigRandom bitShift: -8 * byteCount.
	"Avoid using LargeInteger arithmetic for +1 in most cases."
	result isLarge ifFalse: [ ^result + 1 ].
	(firstDigit := result digitAt: 1) = 255 ifTrue: [ ^result + 1 ].
	result digitAt: 1 put: firstDigit + 1.
	^result
	