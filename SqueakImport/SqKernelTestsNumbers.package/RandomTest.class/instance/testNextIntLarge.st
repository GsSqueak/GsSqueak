tests
testNextIntLarge
	"Generate many 1281-bit integers and see if their bits are equally distributed. This is not an exact test, but it's good enough to find obvious errors in the generator."

	<timeout: 15>
	| random bits bitCounts maxValue runs |
	random := Random seed: 1234567812345678.
	bits := 1281.
	bitCounts := Array new: bits withAll: 0.
	maxValue := 1 << bits.
	runs := 20000.
	runs timesRepeat: [
		| value |
		value := (random nextInt: maxValue) - 1.
		1 to: bits do: [ :bitIndex |
			bitCounts at: bitIndex put: (bitCounts at: bitIndex) + (value bitAt: bitIndex) ] ].
	bitCounts do: [ :each |
		self assert: ((each / (runs / 2)) between: 0.95 and: 1.05) ]
	