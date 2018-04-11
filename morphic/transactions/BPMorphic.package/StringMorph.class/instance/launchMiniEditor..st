editing
launchMiniEditor: evt 
	| _gsSqueakTemp_textMorph |
	hasFocus := true.
	"Really only means edit in progress for this morph"
	_gsSqueakTemp_textMorph := StringMorphEditor new contentsAsIs: contents.
	_gsSqueakTemp_textMorph beAllFont: self fontToUse.
	_gsSqueakTemp_textMorph
		bounds: (self bounds expandBy: 0 @ 2).
	self addMorphFront: _gsSqueakTemp_textMorph.
	evt hand newKeyboardFocus: _gsSqueakTemp_textMorph.
	_gsSqueakTemp_textMorph editor selectFrom: 1 to: _gsSqueakTemp_textMorph paragraph text string size