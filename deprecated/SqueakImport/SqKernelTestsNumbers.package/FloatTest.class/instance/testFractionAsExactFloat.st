testing - conversion
testFractionAsExactFloat
	{
		1/2.
		1<<Float precision - 1 / (1 << 8).
		Float fminNormalized asFraction.
		Float fmin asFraction * 3.
		Float fmin asFraction.
	}
		do: [:f | self assert: f asExactFloat equals: f asFloat]