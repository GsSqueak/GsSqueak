loading
loadPropertiesFrom: aDictionary

	super loadPropertiesFrom: aDictionary.
	gemstoneName := aDictionary at: 'gemstoneName' ifAbsent: [self gemstoneNameMissing]