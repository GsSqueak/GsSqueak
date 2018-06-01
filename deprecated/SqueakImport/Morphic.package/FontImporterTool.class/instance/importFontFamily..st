helper
importFontFamily: readFonts

	|r rest array |
	r := readFonts detect: [:f | 
		[f isRegular] on: Error do: [false] "hack for unknown emphases"
	] ifNone: [^ TTCFont newTextStyleFromTT: readFonts first].
	rest := readFonts copyWithout: r.
	array :=TTCFont pointSizes collect: [:pt | | f | 
		f := TTCFont new ttcDescription: r; pointSize: pt; yourself.
		rest do: [:rf |
			(self isStyleNameSupported: rf subfamilyName)
				ifTrue: [f derivativeFont: (TTCFont new ttcDescription: rf; pointSize: pt; yourself)]
				ifFalse: [
					Transcript show: 'Cannot import unknown style ', rf subfamilyName, ' from Font family ', f name]]. 
		f].
	^ TTCFont reorganizeForNewFontArray: array name: array first name asSymbol.