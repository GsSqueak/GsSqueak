language
chooseNaturalLanguage
	"Put up a menu allowing the user to choose the natural language for the project"

	| aMenu availableLanguages |
	aMenu := MenuMorph new defaultTarget: self.
	aMenu addTitle: 'choose language' translated.
	aMenu lastItem setBalloonText: 'This controls the human language in which tiles should be viewed.  It is potentially extensible to be a true localization mechanism, but initially it only works in the classic tile scripting system.  Each project has its own private language choice' translated.
	Preferences noviceMode
		ifFalse:[aMenu addStayUpItem].

	availableLanguages := NaturalLanguageTranslator availableLanguageLocaleIDs
										sorted:[:x :y | x displayName < y displayName].

	availableLanguages do:
		[:localeID |
			aMenu addUpdating: #stringForLanguageNameIs: target: Locale selector:  #switchAndInstallFontToID: argumentList: {localeID}].
	aMenu popUpInWorld

"Project current chooseNaturalLanguage"