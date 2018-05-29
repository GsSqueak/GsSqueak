private loading
loadAvailableExternalLocales
	"private - register locales IDs based on the content of the <prefs>/locale/ directory"
	| localeDir |
	localeDir := self localeDirCreate: false.
	localeDir ifNil: [^ #()].

	localeDir directoryNames
		do: [:langDirName | 
			| langDir | 
			langDir := localeDir directoryNamed: langDirName.

			(langDir fileNamesMatching: '*.' , self translationSuffix)
				ifNotEmpty: [self loadTranslatorForIsoLanguage: langDirName isoCountry: nil].

			langDir directoryNames
				do: [:countryDirName | 
					| countryDir | 
					countryDir := langDir directoryNamed: countryDirName.
					(countryDir fileNamesMatching: '*.' , self translationSuffix)
						ifNotEmpty: [self loadTranslatorForIsoLanguage: langDirName isoCountry: countryDirName]
			]
		].
