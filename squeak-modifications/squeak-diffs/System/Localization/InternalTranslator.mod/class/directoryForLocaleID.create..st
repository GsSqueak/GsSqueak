private loading
directoryForLocaleID: localeID create: createDir
	"Try to locate the <prefs>/locale/<language>{/<country>} folder.
	If createDir is set, create the path down to country or language, depending on locale.
	Return the directory for country or language depending on locale.
	If neither exists, nil"

	"NaturalLanguageTranslator directoryForLanguage: 'de' country: nil readOnly: true"
	"NaturalLanguageTranslator directoryForLanguage: 'de' country: 'DE' readOnly: true"
	"NaturalLanguageTranslator directoryForLanguage: 'en' country: 'US' readOnly: false"
	"NaturalLanguageTranslator directoryForLanguage: 'en' country: nil readOnly: true"

	^self directoryForLanguage: localeID isoLanguage country: localeID isoCountry create: createDir