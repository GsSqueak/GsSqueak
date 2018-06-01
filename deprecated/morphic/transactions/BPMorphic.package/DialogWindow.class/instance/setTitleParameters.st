initialization
setTitleParameters
	(self submorphNamed: #title)
		ifNotNil: [:title | title
				fillStyle: (self class gradientDialog
						ifTrue: [self
								titleGradientFor: title
								from: (self userInterfaceTheme titleColor
										ifNil: [Color
												r: 0.658
												g: 0.678
												b: 0.78])]
						ifFalse: [SolidFillStyle
								color: (self userInterfaceTheme titleColor
										ifNil: [Color
												r: 0.658
												g: 0.678
												b: 0.78])]);
				
				borderStyle: (self userInterfaceTheme titleBorderStyle
						ifNil: [BorderStyle default]);
				
				borderColor: (self userInterfaceTheme titleBorderColor
						ifNil: [Color
								r: 0.6
								g: 0.7
								b: 1]);
				
				borderWidth: (self userInterfaceTheme titleBorderWidth
						ifNil: [0]);
				
				cornerStyle: (self wantsRoundedCorners
						ifTrue: [#rounded]
						ifFalse: [#square]);
				 vResizing: #shrinkWrap;
				 hResizing: #spaceFill;
				 wrapCentering: #center;
				 cellPositioning: #center;
				 cellInset: 0;
				
				layoutInset: (5 @ 3 corner: 5 @ (2
								+ (self wantsRoundedCorners
										ifTrue: [self cornerRadius]
										ifFalse: [0])))].
	titleMorph
		ifNotNil: [| fontToUse colorToUse |
			fontToUse := self userInterfaceTheme titleFont
						ifNil: [TextStyle defaultFont].
			colorToUse := self userInterfaceTheme titleTextColor
						ifNil: [Color black].
			"Temporary HACK for 64-bit CI build. Can be removed in the
			future. "
			titleMorph contents isText
				ifFalse: [^ self].
			titleMorph contents
				addAttribute: (TextFontReference toFont: fontToUse);
				
				addAttribute: (TextColor color: colorToUse).
			titleMorph releaseParagraph; changed]