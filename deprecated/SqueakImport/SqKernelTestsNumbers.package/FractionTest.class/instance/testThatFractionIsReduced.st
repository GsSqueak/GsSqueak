tests - invariants
testThatFractionIsReduced
	self assert: (4 / 6) numerator equals: 2.
	self assert: (4 / 6) denominator equals: 3.
	
	self assert: (4 / 2) classAndValueEquals: 2.
	
	"Fraction class>>#numerator:denominator: does not automatically reduce the Fraction.
	Since it does not guaranty above invariant, it must be used with care."
	self assert: (Fraction numerator: 4 denominator: 6) numerator equals: 4.
	self assert: (Fraction numerator: 4 denominator: 6) denominator equals: 6.
	self assert: (Fraction numerator: 4 denominator: 6) reduced numerator equals: 2.
	self assert: (Fraction numerator: 4 denominator: 6) reduced denominator equals: 3.