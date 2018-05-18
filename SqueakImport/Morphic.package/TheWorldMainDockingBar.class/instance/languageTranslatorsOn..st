submenu - extras
languageTranslatorsOn: menu

	| availableLanguages |
	availableLanguages := NaturalLanguageTranslator availableLanguageLocaleIDs
		sorted:[:x :y | x displayName < y displayName].
	
	availableLanguages do: [:localeID |
		menu addUpdating: #stringForLanguageNameIs: target: Locale selector:  #switchAndInstallFontToID: argumentList: {localeID}].
