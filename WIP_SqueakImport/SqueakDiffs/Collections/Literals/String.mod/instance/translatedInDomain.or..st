*System-Localization
translatedInDomain: aDomainName or: anotherDomainName
	| translation |
	translation := self translatedTo: LocaleID current inDomain: aDomainName.
	self == translation ifTrue: [^self translatedInDomain: anotherDomainName].
	^translation
