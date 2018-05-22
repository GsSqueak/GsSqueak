preferences
getMenuPreference: aPreferenceSymbol ifAbsent: aBlock

	| project |
	^ (project := Project current) isMorphic
		ifTrue: [project projectPreferenceFlagDictionary at: aPreferenceSymbol ifAbsent: aBlock]
		ifFalse: aBlock
