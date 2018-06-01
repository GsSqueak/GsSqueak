example
sampleText

	| text |
	text := (self isSymbolFont or: [(self basicHasGlyphOf: $a) not])
		ifTrue: [Text symbolSample]
		ifFalse: [Text textSample].
	text addAttribute: (TextFontReference toFont: self).
	^ text