private
derivs: a first: point1 second: point2 third: point3
	"Compute the first, second and third derivitives (in coefficients) from
	the Points in this Path (coefficients at: 1 and coefficients at: 5)."

	| l v anArray |
	l := a size.
	l < 2 ifTrue: [^self].
	l > 2
	  ifTrue:
		[v := Array new: l.
		 v  at:  1 put: 4.0.
		 anArray := Array new: l.
		 anArray  at:  1 put: (6.0 * ((a  at:  1) - ((a  at:  2) * 2.0) + (a  at:  3))).
		 2 to: l - 2 do:
			[:i | 
			v  at:  i put: (4.0 - (1.0 / (v  at:  (i - 1)))).
			anArray
				at:  i 
				put: (6.0 * ((a  at:  i) - ((a  at:  (i + 1)) * 2.0) + (a  at:  (i + 2)))
						- ((anArray  at:  (i - 1)) / (v  at:  (i - 1))))].
		 point2  at: (l - 1) put: ((anArray  at:  (l - 2)) / (v  at:  (l - 2))).
		 l - 2 to: 2 by: 0-1 do: 
			[:i | 
			point2 
				at: i 
				put: ((anArray  at:  (i - 1)) - (point2  at:  (i + 1)) / (v  at:  (i - 1)))]].
	point2 at: 1 put: (point2  at:  l put: 0.0).
	1 to: l - 1 do:
		[:i | point1 
				at: i 
				put: ((a at: (i + 1)) - (a  at:  i) - 
						((point2  at:  i) * 2.0 + (point2  at:  (i + 1)) / 6.0)).
		      point3 at: i put: ((point2  at:  (i + 1)) - (point2  at:  i))]