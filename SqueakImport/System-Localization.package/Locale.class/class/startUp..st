system startUp
startUp: resuming
	resuming ifFalse: [^self].
	(Preferences valueOfFlag: #useLocale)
		ifTrue: [
			| newID |
			newID := self current determineLocaleID.
			newID ~= LocaleID current
				ifTrue: [self switchAndInstallFontToID: newID gently: true]]