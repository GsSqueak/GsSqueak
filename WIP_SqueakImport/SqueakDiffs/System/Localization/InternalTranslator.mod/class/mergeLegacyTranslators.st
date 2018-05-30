accessing
mergeLegacyTranslators
	self availableLanguageLocaleIDs
		do: [:localeID | (NaturalLanguageTranslator translators includesKey: localeID)
				ifFalse: [NaturalLanguageTranslator translators
						at: localeID
						put: (self newLocaleID: localeID)]]