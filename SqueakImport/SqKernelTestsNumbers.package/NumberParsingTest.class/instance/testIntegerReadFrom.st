tests - Integer
testIntegerReadFrom
	"Ensure remaining characters in a stream are not lost when parsing an integer."

	#(
		('13r96 has a radix specification'  123 ' has a radix specification')
		('123r is not a radix specification here'  123 'r is not a radix specification here')
		('-123e has no exponent'  -123 'e has no exponent')
		('-123.e has no exponent'  -123.0 'e has no exponent')
		('-123e2 has an exponent'  -12300 ' has an exponent')
		('123This is not to be read'  123 'This is not to be read')
		('123s is a ScaledDecimal'  123s0 ' is a ScaledDecimal')
		('-123.s is a ScaledDecimal'  -123s0 ' is a ScaledDecimal')
		('123sin is not a ScaledDecimal, s could be part of message sin'  123 'sin is not a ScaledDecimal, s could be part of message sin')
		('123.sin is not a ScaledDecimal, s could be part of message sin'  123.0 'sin is not a ScaledDecimal, s could be part of message sin')
	) do: [ :each |
			[ :string :numericValue :expectedRest |
				| readStream result rest |
				readStream := string readStream.
				result := Number readFrom: readStream.
				rest := readStream upToEnd.
				self assert: result = numericValue.
				self assert: result class = numericValue class.
				self assert: rest = expectedRest] valueWithArguments: each ]
