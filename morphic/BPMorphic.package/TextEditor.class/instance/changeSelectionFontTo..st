attributes
changeSelectionFontTo: aFont 
	| _gsSqueakTemp_attr |
	aFont
		ifNil: [^ self].
	_gsSqueakTemp_attr := TextFontReference toFont: aFont.
	self openTypeIn.
	paragraph text
		addAttribute: _gsSqueakTemp_attr
		from: self startIndex
		to: (self hasSelection
				ifTrue: [self stopIndex - 1 min: paragraph text size]
				ifFalse: [paragraph text size]).
	self closeTypeIn.
	paragraph composeAll.
	self recomputeSelection.
	morph changed