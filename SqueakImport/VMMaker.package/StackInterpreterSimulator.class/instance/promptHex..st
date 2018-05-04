UI
promptHex: string
	| s |
	s := UIManager default request: string, ' (hex)'.
	^s notEmpty ifTrue:
		[(s size > 3 and: [s third = $r]) ifTrue:
			[s := s allButFirst: 3].
		Integer readFrom: s readStream base: 16]