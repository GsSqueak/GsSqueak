tests - mathematical functions
testNthRoot
	"
	FloatTest new testNthRoot
	"
	self should: [ -1.23 nthRoot: 4 ] raise: ArithmeticError