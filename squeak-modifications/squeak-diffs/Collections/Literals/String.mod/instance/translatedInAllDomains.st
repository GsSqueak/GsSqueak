*System-Localization
translatedInAllDomains
	| translation |
	"Transcript show: self printString, ' translatedInAllDomains'; cr."
	TextDomainManager allKnownDomains do: [:domain |
		translation := self translatedTo: LocaleID current inDomain: domain.
		self = translation ifFalse: [^translation]
	].
	^self