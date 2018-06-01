drawing
paragraph: para bounds: bounds color: c

	| scanner |
	self setPaintColor: c.
	scanner := (port clippedBy: (bounds translateBy: origin)) displayScannerFor: para
		foreground: (self shadowColor ifNil:[c]) background: Color transparent
		ignoreColorChanges: self shadowColor notNil.
	para displayOn: (self copyClipRect: bounds) using: scanner at: origin+ bounds topLeft.
