translation
translate: aString toLocaleID: localeID inDomain: aDomainName
	^ (self availableForLocaleID: localeID)
		translate: aString inDomain: aDomainName