nonediting/nontyping keys
cursorPageUp: aKeyboardEvent 
	self insertAndCloseTypeIn.
	self
		moveCursor: [:position | self
				sameColumn: position
				newLine: [:lineNo | lineNo - self pageHeight]
				forward: false]
		forward: false
		event: aKeyboardEvent
		specialBlock: [:dummy | dummy].
	^ true