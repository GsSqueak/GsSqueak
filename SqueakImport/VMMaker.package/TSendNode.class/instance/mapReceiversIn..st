transformations
mapReceiversIn: aDictionary
	receiver mapReceiversIn: aDictionary.
	arguments collect: [:a | a mapReceiversIn: aDictionary]