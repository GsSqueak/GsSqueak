file in/out
storeDataOn: t1 
	| t2 t3 |
	t2 := self basicSize.
	t1 beginInstance: self class size: t2.
	t3 := self numLiterals + 1.
	1
		to: t3
		do: [:t4 | t1
				nextPut: (self objectAt: t4)].
	self initialPC
		to: t2
		do: [:t4 | t1 byteStream
				nextPut: (self basicAt: t4)]