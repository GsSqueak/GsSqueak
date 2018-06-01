project parameters
projectPreferenceAt: aSymbol ifAbsent: aBlock
	"Answer the project preference stored at the given symbol, or the result of evaluating the block"

	^ self projectPreferenceFlagDictionary at: aSymbol ifAbsent: aBlock