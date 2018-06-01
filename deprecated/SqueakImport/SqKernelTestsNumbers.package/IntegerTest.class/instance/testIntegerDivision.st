testing - arithmetic
testIntegerDivision
	| suite |
	suite := #( 1 2 5 1000 123456798  111222333444555 987654321098765432109876 ).
	suite := suite , (suite collect: [:e | e negated]).
	suite do: [:a |
		suite do: [:b |
			| q r |
			q := a // b.
			r := a \\ b.
			self assert: b * q + r = a.
			self assert: r abs < b abs.
			self assert: (r isZero or: [b negative = r negative])]].