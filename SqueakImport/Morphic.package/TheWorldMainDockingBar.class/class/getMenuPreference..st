preferences
getMenuPreference: aPreferenceSymbol

	^ self getMenuPreference: aPreferenceSymbol ifAbsent: [true]