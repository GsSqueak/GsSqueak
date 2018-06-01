*SqClasses-*SqClasses-*SqClasses-shrinking
unloadFonts	"Smalltalk unloadFonts"

	"Unloads all fonts except the style specified initially."

	| fontName fontSize textStyle |
	"Three good choices here:
		* Atlanta 11: Absolutely minimal font.
		* Accuny 10: A few extra sizes over Atlanta.
		* Bitmap DejaVu Sans 9: Nicest fonts but relatively large.
	"
	fontName := #'Bitmap DejaVu Sans'.
	fontSize := 9.

	"Nuke everything other than the desired text style"
	textStyle := TextStyle named: fontName.
	TextStyle defaultFamilyNames do:[:styleName| 
		TextConstants at: styleName put: textStyle
	].
	TextStyle actualTextStyles keys do:[:styleName| 
		TextConstants removeKey: styleName
	].
	TextConstants at: fontName put: textStyle.

	"Use it everywhere"
	Preferences setDefaultFonts: {
		{#setSystemFontTo:.		fontName.	fontSize}.
		{#setListFontTo:.			fontName.	fontSize}.
		{#setFlapsFontTo:.			fontName.	fontSize}.
		{#setEToysFontTo:.			fontName.	fontSize}.
		{#setEToysTitleFontTo:	.	fontName.	fontSize}.
		{#setPaintBoxButtonFontTo:. fontName.	fontSize}.
		{#setMenuFontTo:.			fontName.	fontSize}.
		{#setWindowTitleFontTo:.	fontName.	fontSize}.
		{#setBalloonHelpFontTo:.	fontName.	fontSize}.
		{#setCodeFontTo:.			fontName.	fontSize}.
		{#setButtonFontTo:.		fontName.	fontSize}.
	}.

	"Clean out afterwards"
	Smalltalk at: #TextEditor ifPresent:[:aClass| aClass initialize].
	Smalltalk at: #SmalltalkEditor ifPresent:[:aClass| aClass initialize].
	Smalltalk at: #SystemProgressMorph ifPresent:[:aClass| aClass reset].
	Smalltalk at: #TTCFont ifPresent:[:aClass| aClass registry removeAll].
	Smalltalk at: #Flaps ifPresent:[:aClass | aClass disableGlobalFlaps: false].
	Smalltalk at: #TTFontDescription ifPresent:[:aClass| aClass clearDefault].
	Smalltalk at: #TTFontDescription ifPresent:[:aClass| aClass clearDescriptions].
