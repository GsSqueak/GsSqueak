drawing
paragraph: para bounds: bounds color: c 
	| _gsSqueakTemp_scanner |
	self setPaintColor: c.
	_gsSqueakTemp_scanner := (port
				clippedBy: (bounds translateBy: origin))
				displayScannerFor: para
				foreground: (self shadowColor
						ifNil: [c])
				background: Color transparent
				ignoreColorChanges: self shadowColor notNil.
	para
		displayOn: (self copyClipRect: bounds)
		using: _gsSqueakTemp_scanner
		at: origin + bounds topLeft