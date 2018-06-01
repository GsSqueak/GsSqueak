class initialization
startUp: resuming 
	resuming ifFalse: [^self].
	TranslationLocale = LocaleID current ifTrue:
		[^self].
	self initializeTranslations