initialization
baseDictionary: aDictionary
	baseDictionary := aDictionary.
	entryNames := aDictionary keys asArray sort.
	formChoices := entryNames collect: [:n | aDictionary at: n].
	currentIndex := 1