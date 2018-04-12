helper
importFontFamily: readFonts 
	| _gsSqueakTemp_r _gsSqueakTemp_rest _gsSqueakTemp_array |
	_gsSqueakTemp_r := readFonts
				detect: [:f | [f isRegular]
						on: Error
						do: [false
							"hack for unknown emphases"]]
				ifNone: [^ TTCFont newTextStyleFromTT: readFonts first].
	_gsSqueakTemp_rest := readFonts copyWithout: _gsSqueakTemp_r.
	_gsSqueakTemp_array := TTCFont pointSizes
				collect: [:pt | 
					| f |
					f := TTCFont new ttcDescription: _gsSqueakTemp_r;
								 pointSize: pt;
								 yourself.
					_gsSqueakTemp_rest
						do: [:rf | (self isStyleNameSupported: rf subfamilyName)
								ifTrue: [f derivativeFont: (TTCFont new ttcDescription: rf;
											 pointSize: pt;
											 yourself)]
								ifFalse: [Transcript show: 'Cannot import unknown style ' , rf subfamilyName , ' from Font family ' , f name]].
					f].
	^ TTCFont reorganizeForNewFontArray: _gsSqueakTemp_array name: _gsSqueakTemp_array first name asSymbol