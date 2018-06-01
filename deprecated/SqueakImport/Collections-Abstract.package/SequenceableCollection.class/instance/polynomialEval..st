enumerating
polynomialEval: thisX
	"Treat myself as the coeficients of a polynomial in X.  Evaluate it with thisX.  First element is the constant and last is the coeficient for the highest power."
	"  #(1 2 3) polynomialEval: 2   "   "is 3*X^2 + 2*X + 1 with X = 2"

	| index sum |
	sum := self at: (index := self size).
	[ (index := index - 1) >= 1 ] whileTrue: [
		sum := sum * thisX + (self at: index) ].
	^sum