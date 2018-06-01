private loading
directoryForLanguage: isoLanguage country: isoCountry create: createDir
	"Try to locate the <prefs>/locale/<language>{/<country>} folder.
	If createDir is set, create the path down to country or language, depending on wether it's specified..
	Return the directory for country or language depending on specification.
	If neither exists, nil"

	"NaturalLanguageTranslator directoryForLanguage: 'es' country: nil create: true"
	"NaturalLanguageTranslator directoryForLanguage: 'de' country: 'DE' create: true"
	"NaturalLanguageTranslator directoryForLanguage: 'en' country: 'US' create: false"
	"NaturalLanguageTranslator directoryForLanguage: 'en' country: nil create: true"

	"If this fails, there is nothing we can do about it here"
	| localeDir  countryDir languageDir |
	localeDir := self localeDirCreate: createDir.
	localeDir ifNil: [^nil].

	isoCountry ifNil: [
		languageDir := localeDir directoryNamed: isoLanguage.
		createDir
			ifTrue: [languageDir assureExistence].
		^languageDir exists
			ifTrue: [languageDir]
			ifFalse: [nil]].

	countryDir := languageDir directoryNamed: isoCountry.
	createDir
		ifTrue: [countryDir assureExistence].

	^countryDir exists
		ifTrue: [countryDir]
		ifFalse: [nil]