accessing
default
	"Answer translator for backstop"
	"self default translate: 'test'"
	^ (self == NaturalLanguageTranslator ifTrue: [InternalTranslator] ifFalse: [self]) new
		localeID: (LocaleID isoLanguage: 'en')