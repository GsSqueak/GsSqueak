writing
write85: anInteger atMax: aNumber

	| c1 c2 c3 c4 c5 remain |
	remain := anInteger.
	c5 := (remain \\ 85 + 33) asCharacter. remain := remain // 85.
	c4 := (remain \\ 85 + 33) asCharacter. remain := remain // 85.
	c3 := (remain \\ 85 + 33) asCharacter. remain := remain // 85.
	c2 := (remain \\ 85 + 33) asCharacter. remain := remain // 85.
	c1 := (remain \\ 85 + 33) asCharacter. remain := remain // 85.
	aNumber > 0 ifTrue: [self stringStream nextPut: c1.
	aNumber > 1 ifTrue: [self stringStream nextPut: c2.
	aNumber > 2 ifTrue: [self stringStream nextPut: c3.
	aNumber > 3 ifTrue: [self stringStream nextPut: c4.
	aNumber > 4 ifTrue: [self stringStream nextPut: c5]]]]].
	