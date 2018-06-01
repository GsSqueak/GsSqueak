example
sampleText
	| _gsSqueakTemp_text |
	_gsSqueakTemp_text := (self isSymbolFont
					or: [(self basicHasGlyphOf: $a) not])
				ifTrue: [Text symbolSample]
				ifFalse: [Text textSample].
	_gsSqueakTemp_text
		addAttribute: (TextFontReference toFont: self).
	^ _gsSqueakTemp_text