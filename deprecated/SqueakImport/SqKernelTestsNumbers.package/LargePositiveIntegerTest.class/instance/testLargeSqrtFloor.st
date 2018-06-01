tests
testLargeSqrtFloor
	"This test fails if a careless implementation naivly factors out the power of two (remove the trailing zeroes up to lowBit).
	This was the case in a previous Squeak 4.x implementation."

	| large root |
	large := (SmallInteger maxVal << 100 + 1) << 100.
	root := large sqrtFloor.
	self assert: root squared <= large.
	self assert: (root+1) squared > large.