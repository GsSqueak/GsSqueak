*Morphic-MorphicExtras-copying
updateReferencesUsing: aDictionary
	"If the arguments array points at a morph we are copying, then update it to point to the new copy. This method also copies the arguments array itself, which is important!"

	super updateReferencesUsing: aDictionary.
	arguments := arguments collect:
		[:old | aDictionary at: old ifAbsent: [old]].
