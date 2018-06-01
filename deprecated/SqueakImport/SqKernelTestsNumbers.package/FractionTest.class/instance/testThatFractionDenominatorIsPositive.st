tests - invariants
testThatFractionDenominatorIsPositive
	self assert: (-3 / 2) numerator negative description: 'a Fraction sign is allways carried by its numerator'.
	self assert: (-3 / 2) denominator positive description: 'a Fraction denominator is allways positive'.
	
	self assert: (3 / -2) numerator negative description: 'a Fraction sign is allways carried by its numerator'.
	self assert: (3 / -2) denominator positive description: 'a Fraction denominator is allways positive'.
	
	self assert: (-3 / -2) numerator positive description: 'two negative signs are simplified'.
	self assert: (-3 / -2) denominator positive description: 'a Fraction denominator is allways positive'.