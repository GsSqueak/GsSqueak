stepping
fadeOut
	self magicAlpha <= 0.3 ifTrue:[self stopSteppingSelector: #fadeOut].
	self magicAlpha: ((self magicAlpha - 0.1) max: 0.3)
