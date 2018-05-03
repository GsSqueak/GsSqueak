tests
testZeroDivideHandler
	"Test for user-defined ZeroDivide behavior"

	[
		self assert: 1 / 0 = Float infinity.
		self assert: -1 / 0 = Float negativeInfinity.
		self assert: 1.0 / 0 = Float infinity.
		self assert: -1.0 / 0 = Float negativeInfinity.
		self assert: 1 / 0.0 = Float infinity.
		self assert: -1 / 0.0 = Float negativeInfinity.
		self assert: 1.0 / 0.0 = Float infinity.
		self assert: -1.0 / 0.0 = Float negativeInfinity.
	]	on: ZeroDivide
		do: [:ex | ex resume: ex dividend sign * Float infinity ]
