-Etoys-utilities
restoreClassicEToyLook
	"Restore classic EToy look, as closely as possible. If ComicBold is
	present, restore it as the standard etoy and button font. Substitute
	ComicSansMS and Accuny as respective alternatives if the classic
	fonts are absent. If those also aren't available, do nothing."
	| _gsSqueakTemp_aTextStyle _gsSqueakTemp_aFont |
	(_gsSqueakTemp_aTextStyle := TextStyle named: #ComicBold)
		ifNil: [(_gsSqueakTemp_aTextStyle := TextStyle named: #ComicSansMS)
				ifNotNil: [Preferences
						setEToysFontTo: (_gsSqueakTemp_aTextStyle fontOfSize: 18)].
			(_gsSqueakTemp_aTextStyle := TextStyle named: #Accuny)
				ifNotNil: [Preferences
						setButtonFontTo: (_gsSqueakTemp_aTextStyle fontOfSize: 12)]]
		ifNotNil: [_gsSqueakTemp_aFont := _gsSqueakTemp_aTextStyle fontOfSize: 16.
			Preferences setEToysFontTo: _gsSqueakTemp_aFont.
			Preferences setButtonFontTo: _gsSqueakTemp_aFont].
	(_gsSqueakTemp_aTextStyle := TextStyle named: #NewYork)
		ifNotNil: [Preferences
				setSystemFontTo: (_gsSqueakTemp_aTextStyle fontOfSize: 12)]