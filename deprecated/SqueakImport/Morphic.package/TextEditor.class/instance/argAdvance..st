typing/selecting keys
argAdvance: aKeyboardEvent 
	"Invoked by Ctrl-a or Shift+Command+A.  Useful after Ctrl-q.
	 Search forward from the end of the selection for a colon and place the caret after it.  If no colon is found, do nothing."
	| start |
	self insertAndCloseTypeIn.
	start := paragraph text
		findString: ':'
		startingAt: self stopIndex.
	start isZero ifFalse: [ self selectAt: start + 1 ].
	^ true