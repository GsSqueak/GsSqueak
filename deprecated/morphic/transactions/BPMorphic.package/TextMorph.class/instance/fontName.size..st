accessing
fontName: fontName size: fontSize 
	| _gsSqueakTemp_newTextStyle |
	_gsSqueakTemp_newTextStyle := ((TextStyle named: fontName asSymbol)
				ifNil: [TextStyle default]) copy.
	textStyle := _gsSqueakTemp_newTextStyle.
	text
		addAttribute: (TextFontChange
				fontNumber: (_gsSqueakTemp_newTextStyle fontIndexOfSize: fontSize)).
	paragraph
		ifNotNil: [paragraph textStyle: _gsSqueakTemp_newTextStyle]