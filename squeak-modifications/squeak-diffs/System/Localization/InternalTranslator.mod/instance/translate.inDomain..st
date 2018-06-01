translation
translate: aString inDomain: aDomainName 
	| translator |
	^ self generics
		at: aString
		ifAbsent: [self localeID hasParent
				ifTrue: [translator := self class cachedTranslations
								at: self localeID parent
								ifAbsent: [^ aString].
					translator translate: aString inDomain: aDomainName]
				ifFalse: [aString]]