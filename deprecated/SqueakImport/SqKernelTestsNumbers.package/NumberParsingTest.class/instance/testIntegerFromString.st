tests - Integer
testIntegerFromString
	"This covers parsing in Number>>readFrom:"

	#(
		('123'  123)
		('-123'  -123)
		('123.'  123.0)
		('-123.'  -123.0)
		('123This is not to be read'  123)
		('123s is a ScaledDecimal'  123s0)
		('123sin is not a ScaledDecimal, s could be part of message sin'  123)
		('123e could be confused with a Float' 123)) do: [ :each |
			[ :string :numericValue |
				| result |
				result := string asNumber.
				self assert: result = numericValue.
				self assert: result class = numericValue class] valueWithArguments: each ]
