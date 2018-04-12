helper
fontFromFamily: aFamily 
	| _gsSqueakTemp_readFonts |
	aFamily
		ifNil: [^ TextStyle default fonts first].
	_gsSqueakTemp_readFonts := TTFileDescription readFontsFrom: aFamily allFilenames anyOne.
	^ _gsSqueakTemp_readFonts size > 1
		ifTrue: [| ftArray |
			"see TTCFontSet>>newTextStyleFromTT:"
			ftArray := _gsSqueakTemp_readFonts
						collect: [:ttc | | f | ttc
								ifNotNil: [f := TTCFont new.
									f ttcDescription: ttc.
									f pointSize: 11.0.
									f]].
			TTCFontSet newFontArray: ftArray]
		ifFalse: [| f |
			f := TTCFont new.
			f ttcDescription: _gsSqueakTemp_readFonts anyOne.
			f pointSize: 11.0.
			f]