typing/selecting keys
argAdvance: aKeyboardEvent 
	"Invoked by Ctrl-a or Shift+Command+A. Useful after Ctrl-q.
	Search forward from the end of the selection for a colon and place the
	caret after it. If no colon is found, do nothing."
	| _gsSqueakTemp_start |
	self insertAndCloseTypeIn.
	_gsSqueakTemp_start := paragraph text findString: ':' startingAt: self stopIndex.
	_gsSqueakTemp_start isZero
		ifFalse: [self selectAt: _gsSqueakTemp_start + 1].
	^ true