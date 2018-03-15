-Etoys
applyNewEToyLook
	"Apply the new EToy look based on free fonts, approximating the
	classic look as closely as possible."
	"StandardScriptingSystem applyNewEToyLook"
	"| aTextStyle aFont | 
	aTextStyle := TextStyle named: #BitstreamVeraSansMono.
	aFont := aTextStyle fontOfSize: 12.
	aFont := aFont emphasis: 1.
	Preferences setEToysFontTo: aFont.
	Preferences setButtonFontTo: aFont.
	
	aTextStyle := TextStyle named: #Accushi.
	aFont := aTextStyle fontOfSize: 12.
	Preferences setFlapsFontTo: aFont.
	
	(aTextStyle := TextStyle named: #Accuny)
	ifNotNil:
	[Preferences setSystemFontTo: (aTextStyle fontOfSize: 12)]"
	Preferences setDefaultFonts: #(#(#setEToysFontTo: #BitstreamVeraSansBold 10 ) #(#setButtonFontTo: #BitstreamVeraSansMono 9 ) #(#setFlapsFontTo: #Accushi 12 ) #(#setSystemFontTo: #Accuny 10 ) #(#setWindowTitleFontTo: #BitstreamVeraSansBold 12 ) )