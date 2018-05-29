copying
updateReferencesUsing: aDictionary
	"If the arguments array points at a morph we are copying, then point at the new copy.  And also copies the array, which is important!"

	super updateReferencesUsing: aDictionary.
	arguments := arguments collect:
		[:old | aDictionary at: old ifAbsent: [old]].
