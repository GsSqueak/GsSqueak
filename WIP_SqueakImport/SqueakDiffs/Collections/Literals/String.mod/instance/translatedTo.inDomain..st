*System-Localization
translatedTo: localeID inDomain: aDomainName
	"answer the receiver translated to the given locale id in the textdomain"

	^ NaturalLanguageTranslator translate: self 
								toLocaleID: localeID 
								inDomain:  aDomainName