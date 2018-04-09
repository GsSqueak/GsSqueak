*SqNumbers-truncation and round off
significantDigits: aNumber
	"Round to preserve aNumber significant digits:
	987654321 significantDigits: 1 ==> 1000000000
	987654321 significantDigits: 2 ==> 990000000"
	| digits |
	digits := self numberOfDigitsInBase: 10.
	^self roundTo: (10 raisedTo: digits - aNumber)