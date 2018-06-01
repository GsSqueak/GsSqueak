class initialization
initializeTranslations
	"Initialize the dictionary of <translated menu string>-><icon>"

	TranslationLocale := LocaleID current.
	TranslatedIcons := Dictionary new.
	self itemsIcons do:
		[:assoc|
		assoc key do:
			[:str| TranslatedIcons at: str translated asLowercase put: assoc value]]