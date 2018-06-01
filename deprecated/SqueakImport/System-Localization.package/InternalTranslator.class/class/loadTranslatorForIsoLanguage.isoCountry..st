private loading
loadTranslatorForIsoLanguage: isoLanguage isoCountry: isoCountry 
	"private - load the translations from <prefs>/locale/ directory  
	the procedure is to assure the existence of a translator for the  
	given language/country and then load the external translations for this translator"

	| translator |
	translator := self newLocaleID: (LocaleID isoLanguage: isoLanguage isoCountry: isoCountry).

	self loadExternalTranslationsFor: translator