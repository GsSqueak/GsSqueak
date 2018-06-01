tests - Integer
testIntegerReadFrom
	"Ensure remaining characters in a stream are not lost when parsing an integer."

	| rs i s |
	rs := ReadStream on: '123.s could be confused with a ScaledDecimal'.
	i := SqNumberParser parse: rs.
	self assert: (i isInteger and: [ i = 123 ]).
	s := rs upToEnd.
	self assert: '.s could be confused with a ScaledDecimal' = s
