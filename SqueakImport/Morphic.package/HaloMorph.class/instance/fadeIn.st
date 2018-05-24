stepping
fadeIn
	self magicAlpha >= 1.0 ifTrue:[self stopSteppingSelector: #fadeIn].
	self magicAlpha: ((self magicAlpha + 0.1) min: 1.0)
