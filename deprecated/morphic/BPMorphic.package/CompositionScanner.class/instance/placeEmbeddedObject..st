private
placeEmbeddedObject: anchoredMorph 
	"Workaround: The following should really use #textAnchorType"
	| _gsSqueakTemp_w _gsSqueakTemp_descent |
	anchoredMorph relativeTextAnchorPosition
		ifNotNil: [^ true].
	_gsSqueakTemp_w := anchoredMorph width.
	(destX + _gsSqueakTemp_w > rightMargin
			and: [leftMargin + _gsSqueakTemp_w <= rightMargin
					or: [lastIndex > line first]])
		ifTrue: ["Won't fit, but would on next line"
			^ false].
	destX := destX + _gsSqueakTemp_w + kern.
	_gsSqueakTemp_descent := lineHeight - baseline.
	baseline := baseline max: anchoredMorph height.
	lineHeight := baseline + _gsSqueakTemp_descent.
	^ true