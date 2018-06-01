nonediting/nontyping keys
cursorUp: aKeyboardEvent 
	"Private - Move cursor from position in current line to same position in
	prior line. If prior line too short, put at end"
	self insertAndCloseTypeIn.
	self
		moveCursor: [:position | self
				sameColumn: position
				newLine: [:line | line - 1]
				forward: false]
		forward: false
		event: aKeyboardEvent
		specialBlock: [:dummy | dummy].
	^ true