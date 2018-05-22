project parameters
projectPreferenceFlagDictionary
	"Answer the dictionary that holds the project preferences, creating it if necessary"

	^ projectPreferenceFlagDictionary ifNil: [projectPreferenceFlagDictionary := IdentityDictionary new]