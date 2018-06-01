accessing
fontName: fontName pointSize: fontSize 
	| _gsSqueakTemp_newTextStyle |
	_gsSqueakTemp_newTextStyle := ((TextStyle named: fontName asSymbol)
				ifNil: [TextStyle default]) copy.
	_gsSqueakTemp_newTextStyle
		ifNil: [self error: 'font ' , fontName , ' not found.'].
	textStyle := _gsSqueakTemp_newTextStyle.
	text
		addAttribute: (TextFontChange
				fontNumber: (_gsSqueakTemp_newTextStyle fontIndexOfPointSize: fontSize)).
	paragraph
		ifNotNil: [paragraph textStyle: _gsSqueakTemp_newTextStyle]