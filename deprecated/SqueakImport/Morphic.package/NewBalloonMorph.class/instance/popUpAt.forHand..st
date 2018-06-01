initialization
popUpAt: point forHand: aHand
	"Pop up the receiver as balloon help for the given hand"

	#(bottomLeft topLeft bottomRight topRight) detect: [:nextOrientation |
		| pointWithOffset |
		self orientation: nextOrientation.
		pointWithOffset := point + self tailOffset.
		self move: pointWithOffset.
		self bounds: (self bounds translatedToBeWithin: aHand world bounds).
		(self bounds perform: self orientation) = pointWithOffset] ifNone: ["Keep last try."].
		
	aHand world addMorphFront: self.
	aHand resetBalloonHelp: self.