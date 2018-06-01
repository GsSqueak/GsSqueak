copying
copyFrom: t1 
	self halt.
	t1 isCompiledCode
		ifTrue: [1
				to: self numLiterals
				do: [:t2 | self
						literalAt: t2
						put: (t1 literalAt: t2)]]
		ifFalse: [1
				to: self numLiterals
				do: [:t2 | self
						literalAt: t2
						put: (t1 at: t2)]].
	self initialPC
		to: (self basicSize min: t1 basicSize)
		do: [:t2 | self
				basicAt: t2
				put: (t1 basicAt: t2)]