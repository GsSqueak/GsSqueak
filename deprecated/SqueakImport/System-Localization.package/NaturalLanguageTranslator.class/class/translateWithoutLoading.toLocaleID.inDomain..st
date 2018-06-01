translation
translateWithoutLoading: aString toLocaleID: localeID inDomain: aDomainName
	"try to translate with small footprint:
		if GetTextTranslator hasn't loaded MO, try to use InternalTranslator.
		if InternalTranslator isn't available, then actually load MO and use it"
	| translator |
	translator := self availableForLocaleID: localeID.
	(translator isDomainLoaded: aDomainName) ifFalse: [
		(InternalTranslator availableLanguageLocaleIDs includes: localeID)
			ifTrue:  [translator := InternalTranslator localeID: localeID].
	].
	^translator translate: aString inDomain: aDomainName