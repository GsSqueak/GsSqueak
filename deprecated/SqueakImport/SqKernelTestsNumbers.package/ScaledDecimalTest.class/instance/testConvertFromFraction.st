tests
testConvertFromFraction
	"Converting a Fractionwith asScaledDecimal use strictly necessary number of decimal places when possible."
	
	| defaultNumberOfDecimals |
	0 to: 11 do: [:pow2 |
		0 to: 11 do: [:pow5 |
			| fraction sd sd2 |
			fraction := 13 / (2 raisedTo: pow2) / (5 raisedTo: pow5).
			sd := fraction asScaledDecimal.
			self assert: sd scale = (pow2 max: pow5).
			sd2 := ScaledDecimal readFrom: sd printString.
			self assert: sd = sd2]].
	
	defaultNumberOfDecimals := (1/3) asScaledDecimal scale.
	#(6 7 9 11 12 13 14 17 18 19 21 22 23 24) do: [:den |
		| sd sd2 |
		sd := (1/den) asScaledDecimal.
		self assert: sd scale = defaultNumberOfDecimals.
		sd2 := ScaledDecimal readFrom: sd printString.
		self deny: sd = sd2
		] 