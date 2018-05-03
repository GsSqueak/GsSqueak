testing - arithmetic
testMontgomeryMultiplication
	| a m mInv |
	m := 15485863.
	mInv := m montgomeryDigitBase - ((m bitAnd: m montgomeryDigitMax) reciprocalModulo: m montgomeryDigitBase).
	a := (m montgomeryDigitBase raisedTo: m montgomeryNumberOfDigits) \\ m.
	#(483933 3871465 8951195) do: [:s |
		(s montgomeryTimes: a modulo: m mInvModB: mInv) ifNotNil: [:s1 |
			| s2 sa ssa |
			self assert: s = s1.
			sa := s montgomeryTimes: (a * a \\ m) modulo: m mInvModB: mInv.
			self assert: sa = (s * a \\ m).
			ssa := sa montgomeryTimes: sa modulo: m mInvModB: mInv.
			self assert: ssa = (s * s * a \\ m).
			s2 := ssa montgomeryTimes: 1 modulo: m mInvModB: mInv.
			self assert: s2 = (s * s \\ m)]].