initialization
setText: stringOrText

	| text |
	text := stringOrText asText.

	text hasColorAttribute ifFalse: [
		text addAttribute: (TextColor color: (self userInterfaceTheme textColor ifNil: [Color black]))].
	text hasFontAttribute ifFalse: [
		text addAttribute: (TextFontReference toFont: (self userInterfaceTheme font ifNil: [TextStyle defaultFont]))].
	
	self textMorph wrapFlag: false.
	self textMorph newContents: text.
	self textMorph fullBounds.
	
	(self maximumWidth > 0 and: [self textMorph width > self maximumWidth])
		ifTrue: [
			self textMorph
				wrapFlag: true;
				width: self maximumWidth].
		
	self updateLayout.