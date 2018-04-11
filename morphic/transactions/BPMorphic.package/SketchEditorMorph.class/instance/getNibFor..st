Nebraska support
getNibFor: anEventOrHand 
	^ (self get: #currentNib for: anEventOrHand)
		ifNil: [self
				set: #currentNib
				for: anEventOrHand
				to: palette getNib]