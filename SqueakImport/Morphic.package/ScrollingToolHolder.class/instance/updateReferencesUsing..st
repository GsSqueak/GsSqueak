accessing
updateReferencesUsing: aDictionary
	"Fix up the Morphs I own"
	"Note: Update this method when adding new inst vars that could contain Morphs."

	stampButtons := stampButtons collect:
		[:old | aDictionary at: old ifAbsent: [old]].
	pickupButtons := pickupButtons collect:
		[:old | aDictionary at: old ifAbsent: [old]].
