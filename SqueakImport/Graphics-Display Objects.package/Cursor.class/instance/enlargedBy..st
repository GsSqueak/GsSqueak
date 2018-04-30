converting
enlargedBy: scale
	"Big cursors are 32 bits deep (ARGB premultiplied)"
	| big |
	scale = 1 ifTrue: [^self].
	big := CursorWithAlpha extent: self extent * scale depth: 32.
	(self asCursorForm magnifyBy: scale) displayOn: big.
	big offset: (self offset - 0.5 * scale min: 0@0 max: big extent negated) asIntegerPoint.
	big fallback: self.
	^big