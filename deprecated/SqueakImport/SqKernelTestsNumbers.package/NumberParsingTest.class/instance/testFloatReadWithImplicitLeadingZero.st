tests - Float
testFloatReadWithImplicitLeadingZero
	"Test support for implicit leading zeroes when reading numbers from Strings."
	self should: [-0.22 = '-.22' asNumber].
	self should: [0.22 = '.22' asNumber].
