accessing
switchAndInstallFontToID: localeID 
	"Locale switchAndInstallFontToID: (LocaleID isoLanguage: 'de')"
	| locale |
	locale := Locale localeID: localeID.
	locale languageEnvironment isFontAvailable
		ifFalse: [(self confirm: 'This language needs additional fonts.
Do you want to install the fonts?' translated)
				ifTrue: [locale languageEnvironment installFont]
				ifFalse: [^ self]].
	self
		switchTo: locale