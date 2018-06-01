help dictionary
initializeHelpStrings
	"Initialize the data structure that determines, for the etoy system, help messages for various scripting elements.  The structure is built up by letting every Morph subclass contribute elements simply by implementing method #helpContributions.  Consult implementors of #helpContributions for examples of how this goes."

	"ScriptingSystem initializeHelpStrings"

	| aDictionary |
	aDictionary := IdentityDictionary new.  
	"For safety, the new copy is built up in this temp first, so that if an error occurs during the creation of the structure, the old version will remain remain in place"

	Morph withAllSubclasses do:
		[:aClass | (aClass class includesSelector: #helpContributions)
			ifTrue:
				[aClass helpContributions do:
					[:pair | aDictionary at: pair first put: pair second]]].

		HelpStrings := aDictionary