tests
testReciprocalModulo
	| large r |
	large := 1 bitShift: 48.
	r := Random seed: 46912151.
	4691 timesRepeat:
		[| a b c t |
		a := (r nextInt: large) + 1.
		b := (r nextInt: large) + 1.
		a > b ifTrue: [t := a. a:= b. b := t].
		(a gcd: b) = 1
			ifTrue:
				[c := a reciprocalModulo: b.
				self assert: (a * c) \\ b = 1.]
			ifFalse: [self should: [ a reciprocalModulo: b ] raise: Error]].