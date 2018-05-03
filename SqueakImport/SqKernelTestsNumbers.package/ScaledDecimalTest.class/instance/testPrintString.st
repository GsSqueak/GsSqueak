tests
testPrintString
	"The printed representation of a ScaledDecimal is truncated, not rounded.
	Not sure if this is right, so this test describes the current Squeak implementation.
	If someone knows a reason that rounding would be preferable, then update
	this test."

	| sd |
	sd := (13 / 11) asScaledDecimal: 6.
	self assert: ('1.181818s6' = sd printString).
	sd := (13 / 11) asScaledDecimal: 5.
	self deny: ('1.18182s5' = sd printString).
	sd := (13 / 11) asScaledDecimal: 5.
	self assert: ('1.18181s5' = sd printString)
