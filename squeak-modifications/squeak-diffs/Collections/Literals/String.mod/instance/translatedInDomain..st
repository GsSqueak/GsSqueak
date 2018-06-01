*System-Localization
translatedInDomain: aDomainName
	| translation |
	translation := self translatedTo: LocaleID current inDomain: aDomainName.
	self == translation ifTrue: [^self translatedInAllDomains].
	^translation
