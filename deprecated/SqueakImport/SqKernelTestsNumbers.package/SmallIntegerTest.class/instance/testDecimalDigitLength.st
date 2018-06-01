testing - printing
testDecimalDigitLength

	| x length random |
	"Test edge cases"
	x := 1.
	length := 1.
	[ x <= SmallInteger maxVal ] whileTrue: [
		self 
			assert: length equals: x decimalDigitLength;
			assert: (length - 1 max: 1) equals: (x - 1) decimalDigitLength.
		x := x * 10.
		length := length + 1 ].
	"A few values by hand"
	#(
		0 1
		4 1
		12 2
		123 3
		1234 4
		56789 5
		657483 6
		6571483 7
		65174383 8
		625744831 9
		1000001111 10
	), {
		SmallInteger maxVal. Smalltalk wordSize = 8 ifTrue: [ 19 ] ifFalse: [ 10 ]
	} groupsDo: [ :input :expectedOutput |
		self assert: expectedOutput equals: input decimalDigitLength ].
	"Pseudorandom tests."
	random := Random seed: 36rSqueak.
	10000 timesRepeat: [
		x := SmallInteger maxVal atRandom: random.
		self assert: x asString size equals: x decimalDigitLength ]