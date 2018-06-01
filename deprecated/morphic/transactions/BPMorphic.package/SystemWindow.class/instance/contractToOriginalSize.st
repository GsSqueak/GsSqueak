resize/collapse
contractToOriginalSize
	self bounds: self unexpandedFrame.
	self unexpandedFrame: nil.
	expandBox
		ifNotNil: [expandBox setBalloonText: 'expand this window' translated]