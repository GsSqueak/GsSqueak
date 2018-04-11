nonediting/nontyping keys
cursorPageDown: aKeyboardEvent 
	self insertAndCloseTypeIn.
	self
		moveCursor: [:position | self
				sameColumn: position
				newLine: [:lineNo | lineNo + self pageHeight]
				forward: true]
		forward: true
		event: aKeyboardEvent
		specialBlock: [:dummy | dummy].
	^ true