flaps support
flapsSuppressed: aBoolean
	"Make the setting of the flag that governs whether global flaps are suppressed in the project be as indicated and add or remove the actual flaps"

	self projectPreferenceFlagDictionary at: #showSharedFlaps put: aBoolean not.
	self == Project current 
		ifTrue: "Typical case"
			[Preferences setPreference: #showSharedFlaps toValue: aBoolean not]
