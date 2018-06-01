accessing
availableLanguageLocaleIDs
	"Return locale ids for the internal translation dictionary."
	"InternalTranslator availableLanguageLocaleIDs"
	^ self cachedTranslations values collect:[:each | each localeID]