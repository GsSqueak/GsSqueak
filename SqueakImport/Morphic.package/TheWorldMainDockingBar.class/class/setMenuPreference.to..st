preferences
setMenuPreference: aPreferenceSymbol to: aBoolean
	| project |
	(project := Project current) isMorphic ifTrue: [
		project projectPreferenceFlagDictionary at: aPreferenceSymbol  put: aBoolean.
		(aBoolean ~= (Preferences perform: aPreferenceSymbol))
			ifTrue: [Preferences setPreference: aPreferenceSymbol toValue: aBoolean]].
	self updateInstances.