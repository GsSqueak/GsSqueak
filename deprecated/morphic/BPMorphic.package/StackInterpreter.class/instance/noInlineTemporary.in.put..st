internal interpreter access
noInlineTemporary: offset in: theFP put: valueOop 
	^ self
		temporary: offset
		in: theFP
		put: valueOop