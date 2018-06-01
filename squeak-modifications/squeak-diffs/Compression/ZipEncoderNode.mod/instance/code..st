accessing
code: aCode
	self assert:[aCode >= 0 and:[(1 bitShift: bitLength) > aCode]].
	code := aCode.