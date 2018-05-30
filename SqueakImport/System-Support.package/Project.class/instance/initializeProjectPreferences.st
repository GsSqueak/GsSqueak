project parameters
initializeProjectPreferences
	"Initialize the project's preferences from currently-prevailing preferences that are currently being held in projects in this system"
	
	Project current ifNil: [ ^ self ].
	
	projectPreferenceFlagDictionary := Project current projectPreferenceFlagDictionary deepCopy.    "Project overrides in the new project start out being the same set of overrides in the calling project"

	Preferences allPreferences do:  "in case we missed some"
		[:aPreference |
			aPreference localToProject ifTrue:
				[(projectPreferenceFlagDictionary includesKey: aPreference name) ifFalse:
			[projectPreferenceFlagDictionary at: aPreference name put: aPreference preferenceValue]]].

	(Project current projectParameterAt: #disabledGlobalFlapIDs  ifAbsent: [nil]) ifNotNil:
		[:idList | self projectParameterAt: #disabledGlobalFlapIDs put: idList copy]
