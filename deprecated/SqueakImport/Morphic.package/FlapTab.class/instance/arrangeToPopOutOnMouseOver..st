mouseover & dragover
arrangeToPopOutOnMouseOver: aBoolean
	aBoolean
		ifTrue:
			[self on: #mouseEnter send: #showFlap to: self.
			referent on: #mouseLeave send: #hideFlapUnlessBearingHalo to: self.
			self on: #mouseLeave send: #maybeHideFlapOnMouseLeave to: self]
		ifFalse:
			[self on: #mouseEnter send: nil to: nil.
			self on: #mouseLeave send: nil to: nil.
			referent on: #mouseLeave send: nil to: nil]