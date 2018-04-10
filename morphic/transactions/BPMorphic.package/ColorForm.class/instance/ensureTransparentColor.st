color manipulation
ensureTransparentColor
	"Ensure that the receiver (a) includes Color transparent in its color
	map and (b) that the entry for Color transparent is the first entry in
	its color map."
	| _gsSqueakTemp_i |
	self error: 'not yet implemented'.
	(colors includes: Color transparent)
		ifTrue: [(colors indexOf: Color transparent)
					= 1
				ifTrue: [^ self]]
		ifFalse: [_gsSqueakTemp_i := self unusedColormapEntry.
			_gsSqueakTemp_i = 0
				ifTrue: [self error: 'no color map entry is available'].
			colors at: _gsSqueakTemp_i put: Color transparent]