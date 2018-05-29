accessing
switchAndInstallFontToID: localeID gently: gentlyFlag
	| locale result env envFound ret fontInImage menu |
	"Logic:
		- not in Rainbow, 
			- if the font is in the image, use the font.
			- if the font is not in the image,
				- ask to choose:
					- load font
					- try to enable pango, if pango is available
					- or cancel.
			- if the previous step fails, notify the user that you cannot switch to the language.
	Details:
		- how to check non-pango font is available:
			- if the language environment for the locale doesn't exist, the font is not available.
			- if font loading fails, it is not available.
		- how to check if the language environment doesn't exist:
			- if the locales languageEnvironment is Latin1 but the locale isn't it is not available.
	"	
	locale := Locale localeID: localeID.
	env := locale languageEnvironment.
	result := true.
	envFound := (Latin1Environment supportedLanguages includes: locale isoLanguage) or: [(env isMemberOf: Latin1Environment) not].
	fontInImage := envFound and: [env isFontAvailable].
	fontInImage ifFalse: [
		menu := MenuMorph new.
		menu defaultTarget: menu.
		envFound ifTrue: [menu add: 'load font' translated selector: #modalSelection: argument: #loadFont].
		menu add:  'cancel' translated selector: #modalSelection: argument: #cancel.
		menu addTitle: 'This language needs additional fonts.
Do you want to install the fonts?' translated.
		ret := menu invokeModal.
		ret = #loadFont ifTrue: [result := env installFont. result ifTrue: [StrikeFont setupDefaultFallbackTextStyle]].
		(ret ~~ #loadFont and: [ret ~~ #enablePango]) ifTrue: [result := false]].
	result ifFalse: [self inform: 'Cannot load additional fonts' translated] ifTrue: [self switchTo: locale gently: gentlyFlag].
