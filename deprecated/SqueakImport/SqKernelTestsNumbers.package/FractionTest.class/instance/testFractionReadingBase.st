tests - printing
testFractionReadingBase
	{17/25. -132/271. 127.  -1000} do: [:fraction |
		#(2 3 8 10 16) do: [:base |
			| printed |
			printed := (fraction printStringBase: base) copyWithoutAll: '()'.
			self assert: (Fraction readFrom: printed base: base) equals: fraction]].