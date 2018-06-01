converting
enlargedBy: scale 
	"Big cursors are 32 bits deep (ARGB premultiplied)"
	| _gsSqueakTemp_big |
	scale = 1
		ifTrue: [^ self].
	_gsSqueakTemp_big := CursorWithAlpha extent: self extent * scale depth: 32.
	(self asCursorForm magnifyBy: scale)
		displayOn: _gsSqueakTemp_big.
	_gsSqueakTemp_big offset: (self offset - 0.5 * scale min: 0 @ 0 max: _gsSqueakTemp_big extent negated) asIntegerPoint.
	_gsSqueakTemp_big fallback: self.
	^ _gsSqueakTemp_big