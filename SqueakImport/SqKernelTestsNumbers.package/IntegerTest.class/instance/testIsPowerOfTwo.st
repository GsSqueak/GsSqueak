tests - basic
testIsPowerOfTwo

	| powersOfTwo nonPowersOfTwo |
	powersOfTwo := (0 to: 100) collect: [ :each |
		2 raisedTo: each ].
	nonPowersOfTwo := (powersOfTwo collect: [ :each | each negated ]),
		#(0 3 -3 5 -5 6 -6 7 -7 9 -9 10 -10 100 -100 1000 -1000 12345678 -12345678 1234567890 -1234567890 12345678901234567890 -12345678901234567890).
	powersOfTwo do: [ :each |
		self assert: each isPowerOfTwo ].
	nonPowersOfTwo do: [ :each |
		self deny: each isPowerOfTwo ]