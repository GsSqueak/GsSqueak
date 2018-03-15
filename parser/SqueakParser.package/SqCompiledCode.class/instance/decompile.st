decompiling
decompile
	| t1 t2 |
	t1 := self methodClass
				ifNil: [Object].
	t2 := self selector
				ifNil: [self defaultSelector].
	^ t1 decompilerClass new
		decompile: t2
		in: t1
		method: self methodForDecompile