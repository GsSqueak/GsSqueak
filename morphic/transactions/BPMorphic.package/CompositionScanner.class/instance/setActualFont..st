text attributes
setActualFont: aFont 
	"Keep track of max height and ascent for auto lineheight"
	| _gsSqueakTemp_descent |
	super setActualFont: aFont.
	lineHeight == nil
		ifTrue: [_gsSqueakTemp_descent := font descent.
			baseline := font ascent.
			lineHeight := baseline + _gsSqueakTemp_descent]
		ifFalse: [_gsSqueakTemp_descent := lineHeight - baseline max: font descent.
			baseline := baseline max: font ascent.
			lineHeight := lineHeight max: baseline + _gsSqueakTemp_descent]