testing
testUppercaseExponent
	"An uppercase exponent is allowed"
	
	self assert: 0.01 equals: (ExtendedNumberParser parse: '1.00E-2').
	self assert: 305.0 equals: (ExtendedNumberParser parse: '3.05D+2').