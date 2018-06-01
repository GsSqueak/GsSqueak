copying
updateReferencesUsing: aDictionary
	"Copy and update references in the arguments array during copying."

	super updateReferencesUsing: aDictionary.
	arguments := arguments collect:
		[:old | aDictionary at: old ifAbsent: [old]].
