tests - ScaledDecimal
testScaledDecimalWithImplicitScale
	"Implicit scale is automatically adjusted to the number of fractional digits specified"
	
	#(
		('123s' 123s0)
		('0.5s' 0.5s1)
		('1.60s' 1.60s2)
		('23.070s' 23.070s3)
	) do: [:each |
		[:string :scaledDecimal |
		| value |
		value := SqNumberParser parse: string readStream.
		self assert: value = scaledDecimal.
		self assert: value class = scaledDecimal class.
		self assert: value scale = scaledDecimal scale] valueWithArguments: each]