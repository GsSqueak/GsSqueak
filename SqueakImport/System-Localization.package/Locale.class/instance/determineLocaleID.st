accessing
determineLocaleID
	"Locale current determineLocaleID"
	| isoLang isoCountry |
	isoLang := self fetchISO2Language
				ifNil: [^ self localeID].
	isoCountry := self fetchISOCountry
				ifNil: [^ LocaleID isoLanguage: isoLang].
	^ LocaleID isoLanguage: isoLang isoCountry: isoCountry