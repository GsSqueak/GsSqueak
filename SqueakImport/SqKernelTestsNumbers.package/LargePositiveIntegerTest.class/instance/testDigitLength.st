tests
testDigitLength

	| lpi |
	lpi := 114605103402541699037609980192546360895434064385.
	self assert: 20 equals: lpi digitLength
