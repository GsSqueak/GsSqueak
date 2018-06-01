Nebraska support
getBrushFor: anEventOrHand

	^(self get: #brush for: anEventOrHand) ifNil: [
		self set: #brush for: anEventOrHand to: palette getNib
	].

