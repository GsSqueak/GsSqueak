stepping
fadeInInitially
	| _gsSqueakTemp_max |
	_gsSqueakTemp_max := self isMagicHalo
				ifTrue: [0.3]
				ifFalse: [1.0].
	self magicAlpha >= _gsSqueakTemp_max
		ifTrue: [self stopSteppingSelector: #fadeInInitially].
	self
		magicAlpha: (self magicAlpha + (_gsSqueakTemp_max * 0.1) min: _gsSqueakTemp_max)