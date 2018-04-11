initialization
setMessageParameters
	messageMorph
		ifNotNil: [| fontToUse colorToUse |
			fontToUse := self userInterfaceTheme font
						ifNil: [TextStyle defaultFont].
			colorToUse := self userInterfaceTheme textColor
						ifNil: [Color black].
			messageMorph contents
				addAttribute: (TextFontReference toFont: fontToUse);
				
				addAttribute: (TextColor color: colorToUse).
			messageMorph textColor: colorToUse.
			messageMorph releaseParagraph; changed]