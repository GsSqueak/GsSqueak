file-services
mergeTranslationFileNamed: fileFullNameString 
	"merge the translation in the file named fileFullNameString"

	FileStream readOnlyFileNamed: fileFullNameString do: [:stream |
		| localeID translator |
		localeID := LocaleID isoString: stream localName sansPeriodSuffix.
		translator := self localeID: localeID.
		translator loadFromStream: stream].
	LanguageEnvironment resetKnownEnvironments.

