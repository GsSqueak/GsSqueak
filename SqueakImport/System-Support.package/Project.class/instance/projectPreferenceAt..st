project parameters
projectPreferenceAt: aSymbol
	"Answer the project preference stored at the given symbol.  If there is none in the local preference dictionary, it must be because it was only latterly declared to be a project-local preference, so obtain its initial value instead from the last-known global or default setting"

	
	^ self projectPreferenceAt: aSymbol ifAbsent: 
		[ | aValue |
		aValue := Preferences valueOfFlag: aSymbol.
		self projectPreferenceFlagDictionary at: aSymbol put: aValue.
		^ aValue]