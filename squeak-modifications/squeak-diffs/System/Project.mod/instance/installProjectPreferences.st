menu messages
installProjectPreferences
	"Install the settings of all preferences presently held individually by projects in the receiver's projectPreferenceFlagDictionary"

	
	Preferences allPreferences do:
		[:aPreference | | localValue | 
			aPreference localToProject ifTrue:
				[localValue := self projectPreferenceFlagDictionary at: aPreference name ifAbsent: [nil].
				localValue ifNotNil:
					[aPreference rawValue: localValue]]]