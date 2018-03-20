Nebraska support
getColorFor: anEventOrHand 
	^ (self get: #currentColor for: anEventOrHand)
		ifNil: [self
				set: #currentColor
				for: anEventOrHand
				to: palette getColor]