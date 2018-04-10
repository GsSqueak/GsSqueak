accessing
font: aFont 
	| _gsSqueakTemp_newTextStyle |
	_gsSqueakTemp_newTextStyle := aFont textStyle copy
				ifNil: [TextStyle fontArray: {aFont}].
	textStyle := _gsSqueakTemp_newTextStyle.
	text
		addAttribute: (TextFontChange
				fontNumber: (_gsSqueakTemp_newTextStyle fontIndexOf: aFont)).
	paragraph
		ifNotNil: [paragraph textStyle: _gsSqueakTemp_newTextStyle]