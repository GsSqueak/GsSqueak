other
offsetFromMaxBounds
	"location of normal PaintBox within maxBounds."
	| left |
	left := self left.
	((Preferences canUnderstand: #useBiggerPaintingBox) and: [ Preferences useBiggerPaintingBox ]) ifTrue: [left := left  - (( self width * 1.5)- self width)].
	^ left - colorMemory left @ 0