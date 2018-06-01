Nebraska support
getCursorFor: anEventOrHand 
	| _gsSqueakTemp_plainCursor |
	_gsSqueakTemp_plainCursor := (self get: #currentCursor for: anEventOrHand)
				ifNil: [self
						set: #currentCursor
						for: anEventOrHand
						to: palette plainCursor].
	^ palette
		cursorFor: (self getActionFor: anEventOrHand)
		oldCursor: _gsSqueakTemp_plainCursor
		currentNib: (self getNibFor: anEventOrHand)
		color: (self getColorFor: anEventOrHand)