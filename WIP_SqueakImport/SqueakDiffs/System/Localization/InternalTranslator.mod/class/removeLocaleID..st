accessing
removeLocaleID: localeID 
	"self removeLocaleID: (LocaleID isoString: 'ja-kids')"
	self cachedTranslations
		removeKey: localeID
		ifAbsent: [].
	NaturalLanguageTranslator privateStartUp