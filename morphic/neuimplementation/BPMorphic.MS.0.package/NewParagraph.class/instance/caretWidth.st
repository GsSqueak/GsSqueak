access
caretWidth
	^ Editor dumbbellCursor
		ifTrue: [3]
		ifFalse: [2]