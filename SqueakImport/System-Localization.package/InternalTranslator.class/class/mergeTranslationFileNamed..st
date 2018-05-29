file-services
mergeTranslationFileNamed: fileFullNameString 
	"merge the translation in the file named fileFullNameString"

	| stream localeID translator |
	stream := FileStream readOnlyFileNamed: fileFullNameString.
	[localeID := LocaleID isoString: stream localName sansPeriodSuffix.
	translator := self localeID: localeID.
	translator loadFromStream: stream]
		ensure: [stream close].
	LanguageEnvironment resetKnownEnvironments.

