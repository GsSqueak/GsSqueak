tests - instance creation
testReadFrom
	"Ensure remaining characters in a stream are not lost when parsing an integer."

	#(
		('12' 12 '')
		('-350' -350 '')
		('+27' 27 '')
		('2r101 embedded radix are not allowed' 2 'r101 embedded radix are not allowed')
		('25e3 exponent is ignored' 25 'e3 exponent is ignored')
		('25s2 scale is ignored' 25 's2 scale is ignored')
		('25. decimal separator is ignored' 25 '. decimal separator is ignored')
		('25.30 fraction part is ignored' 25 '.30 fraction part is ignored')
		('123r is not a radix specification' 123 'r is not a radix specification')
	) do: [:each |
		[:string :numericValue :expectedRest |
		| readStream result rest |
		readStream := string readStream.
		result := Integer readFrom: readStream.
		rest := readStream upToEnd.
		self assert: result isInteger.
		self assert: result = numericValue.
		self assert: rest = expectedRest.
		] valueWithArguments: each]