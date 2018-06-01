tests - mathematical functions
testNthRootImmuneToDoubleRounding
	 "Use a specially crafted number for causing double rounding.
	Solution is 10...01.1 - verySmallQuantity.
	Where verySmallQuantity is approximately 1/53/(1<<53).
	If the verySmallQuantity is not taken into account, then solution is rounded to 10....010"
	| exponent crafted root highPrecisionRoot |
	exponent := 4.
	crafted := (1 << Float precision + 3 raisedTo: exponent) - 1.
	root := crafted nthRoot: exponent.
	highPrecisionRoot := (crafted << (exponent squared * Float precision * 4) nthRootRounded: exponent) / (1 << (exponent * Float precision * 4)).
	self assert: (root asFraction - highPrecisionRoot) abs < (root predecessor asFraction - highPrecisionRoot) abs.
	
	"Same with the other sign.
	Solution is 10...00.1 + verySmallQuantity."
	crafted := (1 << Float precision + 1 raisedTo: exponent) + 1.
	root := crafted nthRoot: exponent.
	highPrecisionRoot := (crafted << (exponent squared * Float precision * 4) nthRootRounded: exponent) / (1 << (exponent * Float precision * 4)).
	self assert: (root asFraction - highPrecisionRoot) abs < (root successor asFraction - highPrecisionRoot) abs.