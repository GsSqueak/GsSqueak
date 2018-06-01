stepping
fadeInInitially
	| max |
	max := self isMagicHalo ifTrue:[0.3] ifFalse:[1.0].
	self magicAlpha >= max ifTrue:[self stopSteppingSelector: #fadeInInitially].
	self magicAlpha: ((self magicAlpha + (max * 0.1)) min: max)
