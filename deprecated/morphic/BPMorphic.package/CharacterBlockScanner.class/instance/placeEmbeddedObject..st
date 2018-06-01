private
placeEmbeddedObject: anchoredMorph 
	"Workaround: The following should really use #textAnchorType"
	| _gsSqueakTemp_w |
	anchoredMorph relativeTextAnchorPosition
		ifNotNil: [^ true].
	_gsSqueakTemp_w := anchoredMorph width.
	specialWidth := _gsSqueakTemp_w.
	destX + _gsSqueakTemp_w > characterPoint x
		ifTrue: [^ false].
	destX := destX + _gsSqueakTemp_w + kern.
	^ true