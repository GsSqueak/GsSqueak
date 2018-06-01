initialization
beAllFont: aFont

	textStyle := TextStyle fontArray: (Array with: aFont).
	text ifNotNil: [text addAttribute: (TextFontReference toFont: aFont)].
	self releaseCachedState; changed