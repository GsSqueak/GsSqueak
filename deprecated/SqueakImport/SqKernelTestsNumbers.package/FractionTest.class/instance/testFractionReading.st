tests - printing
testFractionReading
	"Numerator literal syntax"
	self assert: (Fraction readFrom: '4') equals: 4.
	self assert: (Fraction readFrom: '45') equals: 45.
	self assert: (Fraction readFrom: '-45') equals: -45.
	self assert: (Fraction readFrom: '4e2') equals: 400.
	self assert: (Fraction readFrom: '33e-2') equals: 33/100.
	self assert: (Fraction readFrom: '4r123') equals: 1 * 4 + 2 * 4 + 3.
	self assert: (Fraction readFrom: '-4r123e5') equals: 1 * 4 + 2 * 4 + 3 * (4 raisedTo: 5) negated.
	
	"Numerator/Denominator literals syntax"
	self assert: (Fraction readFrom: '23/17') equals: 23/17.
	self assert: (Fraction readFrom: '-122/17') equals: -122/17.
	self assert: (Fraction readFrom: '-3r21e4/8r57e6') equals: (2 * 3 + 1 * (3 raisedTo: 4)) negated /(5 * 8 + 7 * (8 raisedTo: 6)).
	
	"Decimal integer part.fraction part literal syntax"
	self assert: (Fraction readFrom: '0.1') equals: 1/10.
	self assert: (Fraction readFrom: '0.071') equals: 71/1000.
	self assert: (Fraction readFrom: '-0.071e2') equals: -71/10.
	self assert: (Fraction readFrom: '0.07100e-2') equals: 71/100000.
	
	"Extended syntax"
	self assert: (Fraction readFrom: '+4') equals: 4.
	self assert: (Fraction readFrom: '.13') equals: 13/100.
	self assert: (Fraction readFrom: '30.e-2') equals: 3/10.
	self assert: (Fraction readFrom: '+30.e+4') equals: 300000.
	
	"Errors"
	self should: [(Fraction readFrom: '')] raise: Error.
	self should: [(Fraction readFrom: '.')] raise: Error.
	self should: [(Fraction readFrom: 'e3')] raise: Error.
	self should: [(Fraction readFrom: '+e2')] raise: Error.
	self should: [(Fraction readFrom: '-.e+2')] raise: Error.
	self should: [(Fraction readFrom: '/2')] raise: Error.